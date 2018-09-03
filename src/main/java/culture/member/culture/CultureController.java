package culture.member.culture;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.log.SysoCounter;

import culture.member.culture.CultureCommentModel;
import culture.member.culture.CultureModel;
import culture.member.evaluation.MemberModel;
import culture.admin.culture.*;

@Controller
public class CultureController {
	
	@Resource(name="cultureService")
	private CultureService cultureService;
	
	ModelAndView mv = new ModelAndView();
	
	//공연 리스트
	@RequestMapping(value = "/concert/CultureList.cul")
	public ModelAndView cultureList(HttpServletRequest request, CultureModel cultureModel) throws Exception {
		
		
		List<CultureModel> culturelist = cultureService.cultureList();
		
		mv.addObject("cultureList",culturelist);
		
		mv.setViewName("cultureList");
		
		return mv;
	}
	
	//카테고리별로 리스트 뽑아내기
		@RequestMapping("concert/CultureCategoryList.cul")
		public ModelAndView cultureCategoryList(HttpServletRequest request) throws Exception{
			
			String culture_category = request.getParameter("culture_category");
			
			List<CultureModel> cultureCategoryList = cultureService.cultureCategoryList(culture_category);
			
			mv.addObject("cate",culture_category);
			mv.addObject("cultureList", cultureCategoryList);
			mv.setViewName("cultureList");
			return mv;
		}
		
		
	//공연 상세보기 (댓글 추가)
	@RequestMapping("/concert/CultureDetail.cul")
	public ModelAndView cultureDetail(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		int culture_idx = Integer.parseInt(request.getParameter("culture_idx"));
		
		CultureModel cultureModel = cultureService.cultureDetail(culture_idx); 
		//댓글
		List<CultureCommentModel> list = cultureService.cultureCommentList(cultureModel.getCULTURE_IDX());
	
		session.setAttribute("cidx", culture_idx);
		
		//날짜
		String sday = cultureModel.getCULTURE_START();
        String eday = cultureModel.getCULTURE_END();
        
        String start[] = sday.split(" ");
        String end[] = eday.split(" ");
        
        cultureModel.setCULTURE_START(start[0]);
        cultureModel.setCULTURE_END(end[0]);
		
        //좌석가격 가져오는 부분
        String area = cultureModel.getCULTURE_AREA(); //구역  "a,b,c,d"
        String price = cultureModel.getCULTURE_PRICE(); //가격 "1000,2000,3000,4000"
        
        String start1[] = area.split(","); // ,로 구분하여 자른다 (a  b   c   d) 각각 저장
        String start2[] = price.split(",");
        
        String start3[] = new String[start1.length];
        
        for(int i=0; i<start1.length; i++){
        	start3[i] = start1[i]+"-"+start2[i];
        }
      /*  String result = start1.concat(start2);*/
       
        mv.addObject("start3",start3);
		mv.addObject("cultureModel",cultureModel);
		mv.addObject("cultureCommentList",list);
	
		mv.setViewName("cultureDetail");
		
		return mv;
	
	}
	
		
	
	//댓글달기
	@RequestMapping("/concert/writeCultureComment.cul")
	public ModelAndView commentWrite(HttpServletRequest request, CultureCommentModel cultureCommentModel) {
		
		ModelAndView mv = new ModelAndView();
		
		int comment_cultureidx = Integer.parseInt(request.getParameter("item_no"));
		
		cultureCommentModel.setCOMMENT_CONTENT(request.getParameter("COMMENT_CONTENT").replaceAll("\r\n", "<br />"));
		cultureCommentModel.setCOMMENT_CULTUREIDX(comment_cultureidx);
		cultureCommentModel.setCOMMENT_WRITERID("COMMENT_WRITERID");
		
		
		cultureService.writeCultureComment(cultureCommentModel);

		mv.setViewName("redirect:CultureDetail.cul?culture_idx="+comment_cultureidx);
		
		return mv;
		
		
	}
	
	@RequestMapping("/concert/deleteCultureComment.cul")
	public ModelAndView commentDelete(HttpServletRequest request, CultureCommentModel cultureCommentModel ){
	
		ModelAndView mv=new ModelAndView();
		System.out.println("value: "+cultureCommentModel.getCOMMENT_IDX());
		cultureService.deleteCultureComment(cultureCommentModel);
	
		mv.setViewName("redirect:CultureDetail.cul?culture_idx="+cultureCommentModel.getCOMMENT_CULTUREIDX());
	
		return mv;
	
	}
	
	@RequestMapping("/concert/modifyCultureComment.cul")
	public ModelAndView commentModify(HttpServletRequest request, CultureCommentModel cultureCommentModel, CultureModel cultureModel) {
		ModelAndView mv = new ModelAndView();
		cultureService.modifyCultureComment(cultureCommentModel);
		
		mv.addObject("culture_idx",cultureModel.getCULTURE_IDX());
	
		mv.setViewName("redirect:/concert/CultureDetail.cul");
		return mv;
		
	}
	
   
	
}