package culture.admin.culture;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import culture.admin.culture.AdminCultureModel;
import culture.admin.culture.AdminCultureService;
import culture.admin.member.AdminMemberModel;
import culture.admin.member.AdminMemberService;
import culture.admin.member.Paging;
import culture.member.culture.CultureCommentModel;
import culture.member.culture.CultureModel;
import culture.member.culture.CultureService;

@Controller
public class AdminCultureController {

	@Resource(name = "adminCultureService")
	private AdminCultureService adminCultureService;
	
	private int searchNum;
	private String isSearch;

	ModelAndView mav = new ModelAndView();

	private static final String uploadPath = "C:\\Users\\dustn\\Documents\\cultureBOX\\src\\main\\webapp\\cultureimg";

	// 공연리스트(검색추가)
	@RequestMapping(value = "/admin/CultureListForm.cul")
	public ModelAndView adminCultureList(HttpServletRequest request) throws Exception {

		List<AdminCultureModel> adminCultureList = adminCultureService.adminCultureList();
		
		for(int i=0;i<adminCultureList.size();i++){
	           String sday = adminCultureList.get(i).getCULTURE_START();
	           String eday = adminCultureList.get(i).getCULTURE_END();
	           
	           String start[] = sday.split(" ");
	           String end[] = eday.split(" ");
	           
	           adminCultureList.get(i).setCULTURE_START(start[0]);
	           adminCultureList.get(i).setCULTURE_END(end[0]);
	         }
		
		isSearch = request.getParameter("isSearch");
		if(isSearch != null)
		{
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if(searchNum==0)
				adminCultureList = adminCultureService.cultureSearch0(isSearch);
		
			
		mav.addObject("isSearch", isSearch);
		mav.addObject("searchNum", searchNum);
		
		mav.addObject("adminCultureList", adminCultureList); 
		mav.setViewName("adminCultureList"); 


		return mav;
	}

		mav.addObject("adminCultureList", adminCultureList); 
		mav.setViewName("adminCultureList");
		return mav;

	}

	// 공연 상세보기 (댓글 추가)
	@RequestMapping("/admin/CultureDetail.cul")
	public ModelAndView AdminCultureDetail(HttpServletRequest request) throws Exception {

		
		int culture_idx = Integer.parseInt(request.getParameter(""
				+ "culture_idx"));

		AdminCultureModel admincultureModel = adminCultureService.AdminCultureDetail(culture_idx);
		System.out.println("culture idx:" +admincultureModel.getCULTURE_IDX());
		
		List<CultureCommentModel> list = adminCultureService.cultureCommentList(culture_idx);
		
		String sday = admincultureModel.getCULTURE_START();
        String eday = admincultureModel.getCULTURE_END();
        
        String start[] = sday.split(" ");
        String end[] = eday.split(" ");
        
        admincultureModel.setCULTURE_START(start[0]);
        admincultureModel.setCULTURE_END(end[0]);
        
        //좌석가격 가져오는 부분
        String area = admincultureModel.getCULTURE_AREA(); //구역  "a,b,c,d"
        String price = admincultureModel.getCULTURE_PRICE(); //가격 "1000,2000,3000,4000"
        
        String start1[] = area.split(","); // ,로 구분하여 자른다 (a  b   c   d) 각각 저장
        String start2[] = price.split(",");
        
        String start3[] = new String[start1.length];
        
        for(int i=0; i<start1.length; i++){
        	start3[i] = start1[i]+"-"+start2[i];
        }
       
        
		mav.addObject("admincultureModel", admincultureModel);
		mav.addObject("cultureCommentList", list);
		mav.addObject("start3",start3);

		mav.setViewName("adminCultureDetail");

		return mav;

	}

	// 댓글 삭제
	@RequestMapping("/admin/CommentDelete.cul")
	public ModelAndView commentDelete(HttpServletRequest request, CultureCommentModel cultureCommentModel) {

		System.out.println("value: " + cultureCommentModel.getCOMMENT_CULTUREIDX());

		adminCultureService.deleteCultureComment(cultureCommentModel);

		mav.setViewName("redirect:/admin/CultureDetail.cul?culture_idx=" + cultureCommentModel.getCOMMENT_CULTUREIDX());

		return mav;

	}

	// 공연등록폼
	@RequestMapping(value = "/admin/CultureJoinForm.cul")
	public ModelAndView adminJoinForm(HttpServletRequest request) {

		mav.addObject("adminCultureJoinForm", new AdminCultureModel());
		mav.setViewName("adminCultureJoinForm");

		return mav;
	}

	// 공연 등록

	@RequestMapping(value = "/admin/CultureJoin.cul")
	public String CultureJoin(AdminCultureModel cultureModel, BindingResult result,
			MultipartHttpServletRequest multipartHttpServletRequest) throws Exception, Exception {
		ModelAndView mav = new ModelAndView();
		
		/*new ReviewValidator().validate(reviewModel, result);
		 if(result.hasErrors()) { mav.setViewName("reviewWrite"); return "reviewWrite"; }
		 

		
		 * 줄바꿈 String CULTURE_CONTENT =
		 * cultureModel.getCULTURE_CONTENT().replaceAll("\r\n", "<br />");
		 * cultureModel.setCULTURE_CONTENT(CULTURE_CONTENT);*/
		 

		// 업로드
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("file");
		String filename = multipartFile.getOriginalFilename();

		if (filename != "") {
			cultureModel.setCULTURE_SAVNAME(System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename());
			String savimagename = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
			FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath + "/" + savimagename));
			cultureModel.setCULTURE_SAVNAME(savimagename);

		} else {
			cultureModel.setCULTURE_SAVNAME("NULL");
		}

		adminCultureService.CultureJoin(cultureModel);
		
		mav.setViewName("redirect:CultureListForm.cul");

		return "redirect:CultureListForm.cul";
	}

	// 수정폼
	@RequestMapping(value = "/admin/CultureModifyForm.cul")
	
	public ModelAndView adminModifyForm(AdminCultureModel culture, HttpServletRequest request) {
		
		AdminCultureModel oneCulture = new AdminCultureModel();
		oneCulture = adminCultureService.CultureModify(culture.getCULTURE_IDX());
		
		System.out.println("culture:" + oneCulture.getCULTURE_IDX());
		mav.addObject("culture", oneCulture);
		mav.setViewName("adminCultureModifyForm");

		return mav;
	}
	
	
	//수정완료
	@RequestMapping(value = "/admin/CultureModify.cul")
	public ModelAndView adminCultureModify(AdminCultureModel cultureModel, MultipartHttpServletRequest multipartHttpServletRequest) {
		ModelAndView mav = new ModelAndView();
	    
        if (multipartHttpServletRequest.getFile("file") != null){
 		
        	
        	MultipartFile multipartFile = multipartHttpServletRequest.getFile("file");
        	String filename = multipartFile.getOriginalFilename();
	        	if (filename != ""){ 
	        		cultureModel.setCULTURE_SAVNAME(System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename());					    
				    String savimagename = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();				    
			        try {
						FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
					} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}			            	        
	        	}else{
	        		cultureModel.setCULTURE_SAVNAME("NULL");
	        	}
        }
        else{
        	cultureModel.setCULTURE_SAVNAME(multipartHttpServletRequest.getParameter("imagefile_savname"));
        }
        
        adminCultureService.AdminUpdateCulture(cultureModel);
        
      System.out.println("culture:" + cultureModel.getCULTURE_IDX());
		
		mav.addObject("culture", cultureModel.getCULTURE_IDX());
		mav.setViewName("redirect:/admin/CultureListForm.cul");
		return mav;	
	}
	
	
	    //공연,댓글 삭제완료
		@RequestMapping(value = "/admin/CultureDelete.cul")
		public ModelAndView AdminCultureDelete(HttpServletRequest request) throws Exception {

			String CULTURE_IDX = request.getParameter("CULTURE_IDX");

			adminCultureService.AdminCommentDelete(CULTURE_IDX);
			adminCultureService.AdminCultureDelete(CULTURE_IDX);
			
			mav.setViewName("redirect:/admin/CultureListForm.cul");

			return mav;
		}
		
		@RequestMapping(value = "/admin/insertSeat.cul")
		public ModelAndView insertSeat(HttpServletRequest request, HttpSession session, AdminCultureModel cultureModel) throws Exception {
			ModelAndView mv = new ModelAndView();
			String areaC;
			String priceC;
			int DifDate;
			
			seatModel stModel = new seatModel();
			
			int CULTURE_IDX = Integer.parseInt(request.getParameter("CULTURE_IDX"));
			
			System.out.println(CULTURE_IDX);
			
			cultureModel = adminCultureService.getSeat(CULTURE_IDX);
			
			if(cultureModel == null) {
				System.out.println("null");
			} else {
				System.out.println("nt null");
			}
			areaC = cultureModel.getCULTURE_AREA();
			priceC = cultureModel.getCULTURE_PRICE();
			
			String start = cultureModel.getCULTURE_START();
			String end = cultureModel.getCULTURE_END();
			
			String[] startS = start.split("-");
			String[] endS = end.split("-");
			
			String dayY = startS[0];
			String dayM = startS[1];
			
			String[] areaS = areaC.split(",");
			String[] priceS = priceC.split(",");
			
			String[] startS2 = startS[2].split(" ");
			String[] endS2 = endS[2].split(" ");
			String daydd = startS2[0];
			
			DifDate = Integer.parseInt(endS2[0]) - Integer.parseInt(startS2[0]);
			
			for(int t = 0; t <= DifDate; t++) {
					int dayD = Integer.parseInt(daydd) + t;
				for(int i = 0; i < areaS.length; i++) {
					stModel.setSEAT_AREA(areaS[i]);
					stModel.setSEAT_PRICE(Integer.parseInt(priceS[i]));
					for(int k = 1; k <= 10; k++) {
						stModel.setSEAT_CIDX(Integer.parseInt(request.getParameter("CULTURE_IDX")));
						stModel.setSEAT_NUMBER(k);
						stModel.setSEAT_DATE(dayY.concat("-").concat(dayM).concat("-").concat(String.valueOf(dayD)));
						stModel.setSEAT_NAME(stModel.getSEAT_AREA().concat("-").concat(String.valueOf(k)));
						
						adminCultureService.insertSeat(stModel);
					}
				}
			}
			
			mav.setViewName("redirect:/admin/CultureListForm.cul");
			
			return mv;
		}
	}




   


