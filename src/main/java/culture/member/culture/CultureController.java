package culture.member.culture;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



import culture.member.culture.CultureCommentModel;

import culture.member.culture.CultureModel;

@Controller
public class CultureController {
	
	@Resource(name="cultureService")
	private CultureService cultureService;
	
	ModelAndView mv = new ModelAndView();
	
	//공연 리스트
	@RequestMapping(value = "/concert/CultureList.cul")
	public ModelAndView cultureList(HttpServletRequest request) throws Exception {
		
		List<CultureModel> culturelist = cultureService.cultureList();
		mv.addObject("cultureList",culturelist);
		mv.setViewName("cultureList");
		
		return mv;
	}
	
	//공연 상세보기 (댓글 추가)
	@RequestMapping("/concert/CultureDetail.cul")
	public ModelAndView cultureDetail(HttpServletRequest request) throws Exception{
		
		int culture_idx = Integer.parseInt(request.getParameter("culture_idx"));
		
		CultureModel cultureModel = cultureService.cultureDetail(culture_idx);
		//System.out.println("culture idx: "+cultureModel.getCULTURE_IDX());
		List<CultureCommentModel> list = cultureService.cultureCommentList(cultureModel.getCULTURE_IDX());
		//System.out.println("size: "+list.size());
		mv.addObject("cultureModel",cultureModel);
		mv.addObject("cultureCommentList",list);
		
		mv.setViewName("cultureDetail");
		
		return mv;
	
	}
	
	//댓글달기
	@RequestMapping("/concert/writeCultureComment.cul")
	public ModelAndView commentWrite(HttpServletRequest request, CultureCommentModel cultureCommentModel) {
		
		ModelAndView mv = new ModelAndView();
		
		
		System.out.println("11111111111111111111111111111111111111");
		int comment_cultureidx = Integer.parseInt(request.getParameter("item_no"));
		
		System.out.println("content: "+request.getParameter("COMMENT_CONTENT"));
		
		cultureCommentModel.setCOMMENT_CONTENT(request.getParameter("COMMENT_CONTENT").replaceAll("\r\n", "<br />"));
		cultureCommentModel.setCOMMENT_CULTUREIDX(comment_cultureidx);
/*		cultureCommentModel.setCOMMENT_WRITERID("COMMENT_WRITERID");*/
		
		
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
	
	@ResponseBody
	@RequestMapping(value="/concert/join.box", produces="text/plain")
	public String join() {
		
		return "asd";
	}
	

	
	
	
}