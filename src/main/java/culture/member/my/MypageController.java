package culture.member.my;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOError;
import java.io.IOException;
import java.sql.ParameterMetaData;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import culture.member.culture.CultureModel;
import culture.member.culture.CultureService;
import culture.member.evaluation.MemberModel;
import culture.member.evaluation.MusicModel;
import culture.member.reservation.reserveModel;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {
	
	@Resource(name="mypageService")
	MypageService mypageService;
	ModelAndView mav = new ModelAndView();
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value = ""
			+ "", method = RequestMethod.GET)
	public ModelAndView downloadPdf(Model model, HttpSession session, HttpServletRequest request) {
	  Map<String, Object> parameter = new HashMap<String, Object>();
	  parameter.put("RESERVE_ID", request.getParameter("id"));
	  parameter.put("CULTURE_IDX", request.getParameter("cidx"));
	  
	  ModelAndView modelAndView = new ModelAndView("pdfView", "fileName", "Ticket.pdf");
	  List<Map<String, Object>> list =  mypageService.reserveList(parameter);
	  model.addAttribute("pdfView", list);
	  
	  
	  return modelAndView;
	}
	
	@RequestMapping(value="/generate/qrcode.cul")
	public void generateQRcode(HttpServletRequest request, HttpSession session) throws WriterException, IOException{
		Map<String , Object> parameter = new HashMap<String, Object>();
		
		
		String qrCodeText = "http://localhost:8080/culture/concert/CultureDetail.cul?culture_idx="+request.getParameter("culture_idx");
		String fileName = System.currentTimeMillis()+"_"+"QRcode.png";
		String filePath = "/Users/kimjihoon/Documents/spring/mavenApp/culture/src/main/webapp/WEB-INF/qrcode/"+fileName;
		int size = 100;
		String fileType = "png";
		File qrFile =  new File(filePath);
		
		parameter.put("CULTURE_IDX",session.getAttribute("culture_idx"));
		parameter.put("CULTURE_QRCODE", fileName);
		
		createQRImage(qrFile, qrCodeText, size, fileType);	//qr코드를 만든다. 
		mypageService.updateQRcode(parameter);	//디비에 qr코드 파일이름을 저장해둔다.
		
		
		System.out.println("DONE");
	}
	
	private static void createQRImage(File qrFile, String qrCodeText, int size, String fileType)
			throws WriterException, IOException {
		// Create the ByteMatrix for the QR-Code that encodes the given String
		Hashtable<EncodeHintType, ErrorCorrectionLevel> hintMap = new Hashtable<>();
		hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		BitMatrix byteMatrix = qrCodeWriter.encode(qrCodeText, BarcodeFormat.QR_CODE, size, size, hintMap);
		// Make the BufferedImage that are to hold the QRCode
		int matrixWidth = byteMatrix.getWidth();
		BufferedImage image = new BufferedImage(matrixWidth, matrixWidth, BufferedImage.TYPE_INT_RGB);
		image.createGraphics();

		Graphics2D graphics = (Graphics2D) image.getGraphics();
		graphics.setColor(Color.WHITE);
		graphics.fillRect(0, 0, matrixWidth, matrixWidth);
		// Paint and save the image using the ByteMatrix
		graphics.setColor(Color.BLACK);

		for (int i = 0; i < matrixWidth; i++) {
			for (int j = 0; j < matrixWidth; j++) {
				if (byteMatrix.get(i, j)) {
					graphics.fillRect(i, j, 1, 1);
				}
			}
		}
		ImageIO.write(image, fileType, qrFile);
	}
	@RequestMapping(value="/mypage/memberdeleteForm.cul", method=RequestMethod.GET)
   	public ModelAndView memberDeleteForm() {
   		mav.setViewName("memberDeleteForm");
   		return mav;
   	}
		
	
	@RequestMapping(value="/mypage/memberDelete.cul", method=RequestMethod.POST)
   	public ModelAndView memberDelete(@ModelAttribute("member") MemberModel member, BindingResult result, HttpSession session, HttpServletRequest request) {
   		
   		MemberModel memberModel; 
   		
   		String id;
   		String password;
   		password = request.getParameter("MEMBER_PASSWORD");
   		int deleteCheck;
   		id = session.getAttribute("id").toString();
   		memberModel = (MemberModel) mypageService.getMember(id);
   		System.out.print(memberModel);
   		
   		if(memberModel.getMEMBER_PASSWORD().equals(password)) {
   			System.out.print(password);
   		
   			deleteCheck = 1;
   			
   			mypageService.memberDelete(id);
   			session.removeAttribute("id");
   			session.removeAttribute("name");
   			session.removeAttribute("email");
   			session.removeAttribute("password");
   			
   			mav.addObject("deleteCheck", deleteCheck);
   			mav.setViewName("deletesuccess");
   	   		return mav;
   		}
   		else {
   			deleteCheck = -1; 
   		}
   		
   		mav.addObject("deleteCheck", deleteCheck);
   		mav.setViewName("deletesuccess");
   		return mav;
   	}
	
	
	
	    //mypage main
		@RequestMapping(value="/mypage/mypage.cul", method=RequestMethod.GET)
		public ModelAndView mypage(@ModelAttribute("member") MemberModel member, BindingResult result, HttpServletRequest requeset, HttpSession session){
			MemberModel MemberModel;
			String MEMBER_ID;
							
			mav.setViewName("myPage");
			return mav;
			
			
		}
		
		
		//memberModify
		@RequestMapping(value="/mypage/memberModifyForm.cul", method=RequestMethod.GET)
		public ModelAndView ModifyForm(@ModelAttribute("member") MemberModel member, BindingResult result, HttpServletRequest requeset, HttpSession session){
			MemberModel MemberModel;
			String MEMBER_ID;
			
			MEMBER_ID = session.getAttribute("id").toString();
			MemberModel = (MemberModel)mypageService.getMember(MEMBER_ID);
				
			mav.setViewName("modifyForm");
			return mav;
			
			
		}
		@RequestMapping(value="/mypage/memberModify.cul", method=RequestMethod.POST)
		public ModelAndView memberModify(@ModelAttribute("member") MemberModel memberModel, BindingResult result, HttpSession session){
			
			if(session.getAttribute("id") == null){
				mav.setViewName("signUpForm");
				return mav;
			}
			
		/*	MemberModel memberModel = new MemberModel();*/
		
			if(session.getAttribute("id") != null){
				mypageService.memberModify(memberModel);
			
				
				
				mav.setViewName("myPage");
				return mav;
			}
			
			mav.setViewName("signUpForm");
			return mav;
		}
		
		@RequestMapping("/mypage/myEval.cul")
		public String myEvalList(Model model, HttpServletRequest request) {
			HttpSession session =  request.getSession();
			String id = (String)session.getAttribute("id");
			
			Map<String, Object> parameter = new HashMap<String, Object>();
			parameter.put("MEMBER_ID", id);
			
			List<Map<String, Object>> myEvalList = mypageService.getMyEvalList(parameter); 
			for(int i=0;i<myEvalList.size();i++) {
				System.out.println(myEvalList.get(i));
			}

			model.addAttribute("myEvalList",myEvalList);
			
			return "evalMusicList";
		}
		
		//예약내역 리스트
		@RequestMapping(value="/mypage/memberOrderList.cul")
		public String reserveList(Model model, HttpServletRequest request) {
			HttpSession session = request.getSession();
			
			/*String id=(String)session.getAttribute("id");*/
		     String id="pray";
			
			Map<String, Object> parameter = new HashMap<String, Object>();
			
		    parameter.put("RESERVE_ID", id);
			
			
			List<Map<String, Object>> reserveList = mypageService.reserveList(parameter);
			for(int i=0; i<reserveList.size(); i++) {
				System.out.println(reserveList.get(i));
			}
		
			model.addAttribute("reserveList",reserveList);
/*		model.addAttribute("id",id);*/
			
			return "reserveList";
		}
		
		
		
	
}


















