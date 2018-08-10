package culture.admin.reserve;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import culture.admin.reserve.AdminReserveModel;
import culture.admin.reserve.AdminReserveService;


@Controller
public class AdminReserveController {

	@Resource(name="adminReserveService")  // 의존주입 해서 사용하기 위해
	
	private AdminReserveService adminReserveService;
	
	
	
	
	//goods admin 리스트
	@RequestMapping("/admin/ReserveListForm.box")// 이요청이 들어오면 실행!
	public ModelAndView AdminReserveList(HttpServletRequest request) throws Exception{
		System.out.println("111111111111111111111111111111");

		ModelAndView mav = new ModelAndView();
		
		List<AdminReserveModel> AdminReserveList = adminReserveService.AdminReserveList();
		System.out.println("22222222222222222222222222");

			mav.addObject("adminReserveListForm", AdminReserveList); // 이 AdminReserveList 모델 객체를 "adminReserveListForm" 이름으로 adminReserveListForm.jsp 에서 사용한다! 
			mav.setViewName("adminReserveListForm");  // 보여줄jsp  파일 이름! 
			return mav;
		}
	
	
	
	
	@RequestMapping("/admin/ReserveDetail.box")
	public ModelAndView AdminReserveDetail(HttpServletRequest request) throws Exception{
		
		ModelAndView mav = new ModelAndView();

		
		int RESERVE_IDX = Integer.parseInt(request.getParameter("RESERVE_IDX"));


		AdminReserveModel adminReserveModel= adminReserveService.AdminReserveDetail(RESERVE_IDX);
	
		
		mav.addObject("adminReserveDetail", adminReserveModel);
		mav.setViewName("adminReserveDetail");  

		return mav;
		
	}
	
	@RequestMapping("/admin/ReserveDelete.box")
	public ModelAndView AdminReserveDelete(HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int RESERVE_IDX = Integer.parseInt(request.getParameter("RESERVE_IDX"));
		
		adminReserveService.AdminReserveDelete(RESERVE_IDX);
		
		mav.setViewName("redirect:/admin/ReserveListForm.box");
		return mav;
		
		/*ModelAndView mav = new ModelAndView();
		
		int RESERVE_IDX = Integer.parseInt(request.getParameter("RESERVE_IDX"));
		
		
		AdminReserveModel adminReserveModel= adminReserveService.AdminReserveDelete(RESERVE_IDX);
		
		mav.addObject("adminReserveDelete", adminReserveModel);
		mav.setViewName("adminReserveListForm");  
		System.out.println("11111111111111111111111111111111111111");
		return mav;*/
	}
	
/*	@RequestMapping("/notice/noticeDelete.dog")
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
	
	
	
	
	
		
}
		