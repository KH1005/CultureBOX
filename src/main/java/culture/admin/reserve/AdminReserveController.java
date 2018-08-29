package culture.admin.reserve;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import culture.admin.reserve.AdminReserveModel;
import culture.admin.reserve.AdminReserveService;
import culture.member.evaluation.EvalService;
import culture.admin.member.AdminMemberModel;
import culture.admin.member.Paging;
import culture.admin.music.AdminMusicModel;




@Controller
public class AdminReserveController {

   @Resource(name="adminReserveService")  // ?섏〈二쇱엯 ?댁꽌 ?ъ슜?섍린 ?꾪빐
   
   private AdminReserveService adminReserveService;
   
   // ?섏씠吏?
   private int searchNum;
   private String isSearch;

   private int currentPage = 1;
   private int totalCount;
   private int blockCount = 10;
   private int blockPage = 5;
   private String pagingHtml;
   private Paging page;
   
   
   ModelAndView mav = new ModelAndView();

   
   //goods admin 由ъ뒪??
   @RequestMapping("/admin/ReserveListForm.cul")// ?댁슂泥?씠 ?ㅼ뼱?ㅻ㈃ ?ㅽ뻾!
   public ModelAndView AdminReserveList(HttpServletRequest request) throws Exception{


      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
            || request.getParameter("currentPage").equals("0")) {
         currentPage = 1;
      } else {
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
      }
      
      List<AdminReserveModel> AdminReserveList = adminReserveService.AdminReserveList();
/*      List<AdminCultureModel> AdminCultureList = adminCultureService.adminCultureList();
*/
      
      
      /*			System.out.println("isSearch=======>>>>>>>"+request.getParameter("isSearch"));
      */  
      /*			if(isSearch != null) isSearch = new String(isSearch.getBytes("8859_1"), "UTF-8");
      */
      				
      isSearch = request.getParameter("isSearch");
      
/*      System.out.println("isSearch=======>>>>>>>"+request.getParameter("isSearch"));	
*/
      if (isSearch != null) {
         searchNum = Integer.parseInt(request.getParameter("searchNum"));

         if (searchNum == 0)
            AdminReserveList = adminReserveService.reserveSearch0(isSearch);
         else if(searchNum==1)
             AdminReserveList = adminReserveService.reserveSearch1(isSearch);
	     else if(searchNum==2)
	            AdminReserveList = adminReserveService.reserveSearch2(isSearch);

         totalCount = AdminReserveList.size();
         page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminReserveListForm", searchNum, isSearch);
         pagingHtml = page.getPagingHtml().toString();

         int lastCount = totalCount;

         if (page.getEndCount() < totalCount)
            lastCount = page.getEndCount() + 1;

         AdminReserveList = AdminReserveList.subList(page.getStartCount(), lastCount);

         mav.addObject("isSearch", isSearch);
         mav.addObject("searchNum", searchNum);
         mav.addObject("totalCount", totalCount);
         mav.addObject("pagingHtml", pagingHtml);
         mav.addObject("currentPage", currentPage);
         mav.addObject("adminReserveListForm", AdminReserveList);
         mav.setViewName("adminReserveListForm"); // 蹂댁뿬以꼓sp ?뚯씪 ?대쫫!

         return mav;
      }
      
      totalCount = AdminReserveList.size();

      page = new Paging(currentPage, totalCount, blockCount, blockPage, "ReserveListForm");
      pagingHtml = page.getPagingHtml().toString();

      int lastCount = totalCount;

      if (page.getEndCount() < totalCount)
         lastCount = page.getEndCount() + 1;

      AdminReserveList = AdminReserveList.subList(page.getStartCount(), lastCount);
      mav.addObject("totalCount", totalCount);
      mav.addObject("pagingHtml", pagingHtml);
      mav.addObject("currentPage", currentPage);
      mav.addObject("adminReserveListForm", AdminReserveList); // ??AdminReserveList 紐⑤뜽 媛앹껜瑜?"adminReserveListForm" ?대쫫?쇰줈 adminReserveListForm.jsp ?먯꽌 ?ъ슜?쒕떎! 
         mav.setViewName("adminReserveListForm");  // 蹂댁뿬以꼓sp  ?뚯씪 ?대쫫! 
         return mav;
      }
   
    
   
   
   @RequestMapping("/admin/ReserveDetail.cul")
   public ModelAndView AdminReserveDetail(HttpServletRequest request) throws Exception{
      
      ModelAndView mav = new ModelAndView();

      
      int RESERVE_IDX = Integer.parseInt(request.getParameter("RESERVE_IDX")); //jsp ?먯꽌 蹂대궡以 ?뚮씪誘명꽣 媛믪쓣 諛쏅뒗?? 


      AdminReserveModel adminReserveModel= adminReserveService.AdminReserveDetail(RESERVE_IDX);
   
      
      mav.addObject("adminReserveDetail", adminReserveModel);
      mav.setViewName("adminReserveDetail");  

      return mav;
      
   }
   
   @RequestMapping("/admin/ReserveDelete.cul")
   public ModelAndView AdminReserveDelete(HttpServletRequest request) throws Exception {

      ModelAndView mav = new ModelAndView();
      
      int RESERVE_IDX = Integer.parseInt(request.getParameter("RESERVE_IDX"));
      
      adminReserveService.AdminReserveDelete(RESERVE_IDX);
      
      mav.setViewName("redirect:/admin/ReserveListForm.cul");
      return mav;
      
      /*ModelAndView mav = new ModelAndView();
      
      int RESERVE_IDX = Integer.parseInt(request.getParameter("RESERVE_IDX"));
      
      
      AdminReserveModel adminReserveModel= adminReserveService.AdminReserveDelete(RESERVE_IDX);
      
      mav.addObject("adminReserveDelete", adminReserveModel);
      mav.setViewName("adminReserveListForm");  
      System.out.println("11111111111111111111111111111111111111");
      return mav;*/
   }
   
/*   @RequestMapping("/notice/noticeDelete.dog")
   public ModelAndView noticeDelete(HttpServletRequest request){
      
      ModelAndView mav = new ModelAndView();
      int no = Integer.parseInt(request.getParameter("no"));
      noticeService.noticeDelete(no);
      mav.setViewName("redirect:noticeList.dog");
      
      return mav;   
   }
   
   
   
   @RequestMapping(value = "/QnADelete.dog")
   public ModelAndView qnaDelete(HttpServletRequest request, QnAModel qnaModel) {
      ModelAndView mav = new ModelAndView();

      qnAService.QnADelete(qnaModel.getNo());
      qnAService.QnAallcommDelete(qnaModel.getNo());
      mav.setViewName("redirect:/QnA/QnAList.dog");

      return mav;
   }
   
   */
   //결제확인
   @RequestMapping("/admin/ReserveModify.cul")
   public ModelAndView adminMemberModify(AdminReserveModel reserve, HttpServletRequest request) {
		
	      ModelAndView mav = new ModelAndView();

	      
		adminReserveService.AdminReserveModify(reserve);
		

		mav.setViewName("redirect:http://localhost:8080/culture/admin/ReserveListForm.cul");
		return mav;
	}
   
   
   //결제취소
   @RequestMapping("/admin/ReserveModifyBack.cul")
   public ModelAndView adminMemberModifyBack(AdminReserveModel reserve, HttpServletRequest request) {
		
	      ModelAndView mav = new ModelAndView();

	      
		adminReserveService.AdminReserveModifyBack(reserve);

		mav.setViewName("redirect:http://localhost:8080/culture/admin/ReserveListForm.cul");
		return mav;
	}
   
   //전체결제확인
   @ResponseBody
   @RequestMapping("/admin/ReserveModifyAll.cul")
   public Map<String, Object> adminMemberModifyAll(AdminReserveModel reserve, HttpServletRequest request) {
			System.out.println("in");
	   		System.out.println("check=======>>>>>>>"+request.getParameter("value"));	
	   		String reserve_idx = request.getParameter("value");
	   		Map<String, Object> map = new HashMap<String, Object>();
	   		
	   		String[] idxArr = reserve_idx.split("/");
	   		for(int i=0;i<idxArr.length;i++) {
	   			
	   			adminReserveService.AdminReserveModifyAll(idxArr[i]);

	   		
	   				//reserve_idx값 다 넘어온다 하나씩 쪼개놨으니까 서비스에서 호출만 하면 돼
	   				//idxArr[i]이용해서 디비에 보내면돼
	   			
	   			
	   		}
	   		
	   		map.put("code", "success");
	   

	      
		/*adminReserveService.AdminReserveModify(reserve);*/
		

		return map;
	}
   	//전체결제 취소
   @ResponseBody
   @RequestMapping("/admin/ReserveModifyBackAll.cul")
   public Map<String, Object> adminMemberModifyBackAll(AdminReserveModel reserve, HttpServletRequest request) {
			System.out.println("in");
	   		System.out.println("check=======>>>>>>>"+request.getParameter("value"));	
	   		String reserve_idx = request.getParameter("value");
	   		Map<String, Object> map = new HashMap<String, Object>();
	   		
	   		String[] idxArr = reserve_idx.split("/");
	   		for(int i=0;i<idxArr.length;i++) {
	   			
	   			adminReserveService.AdminReserveModifyBackAll(idxArr[i]);

	   		
	   				//reserve_idx값 다 넘어온다 하나씩 쪼개놨으니까 서비스에서 호출만 하면 돼
	   				//idxArr[i]이용해서 디비에 보내면돼
	   			
	   			
	   		}
	   		
	   		map.put("code", "success");
	   

	      
		/*adminReserveService.AdminReserveModify(reserve);*/
		

		return map;
	}
   
   
   
   //?꾩껜寃곗젣?뺤씤
  /* @RequestMapping("/admin/ReserveModifyAll.cul")
   public ModelAndView adminMemberModify(AdminReserveModel reserve, HttpServletRequest request) {
		
	      ModelAndView mav = new ModelAndView();

	      
		adminReserveService.AdminReserveModify(reserve);
		

		mav.setViewName("redirect:http://localhost:8080/culture/admin/ReserveListForm.cul");
		return mav;
	}*/
   
   
   
   
      
}
      