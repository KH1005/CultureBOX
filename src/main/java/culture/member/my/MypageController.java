package culture.member.my;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOError;
import java.io.IOException;
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

/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {
	
	@Resource(name="mypageService")
	MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value = "/download/pdf.cul", method = RequestMethod.GET)
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
	
	
}


















