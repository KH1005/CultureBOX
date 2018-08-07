package culture.member.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import culture.member.model.CultureModel;
import culture.member.service.CultureService;

@Controller
public class CultureController {
	
	@Resource(name="cultureService")
	private CultureService cultureService;
	
	ModelAndView mv = new ModelAndView();
	
	//공연 리스트
	@RequestMapping(value = "/culture/concert/CultureList.box")
	public ModelAndView cultureList(HttpServletRequest request) throws Exception {
		
		List<CultureModel> culturelist = cultureService.cultureList();
		mv.addObject("cultureList",culturelist);
		mv.setViewName("cultureList");
		
		return mv;
	}
	
}