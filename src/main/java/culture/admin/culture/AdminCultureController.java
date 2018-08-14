package culture.admin.culture;

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

import culture.admin.culture.AdminCultureModel;
import culture.admin.culture.AdminCultureService;
import culture.admin.member.AdminMemberModel;
import culture.admin.member.AdminMemberService;


@Controller
public class AdminCultureController {

	@Resource(name = "adminCultureService")
	private AdminCultureService adminCultureService;

	ModelAndView mav = new ModelAndView();

	//공연리스트
	@RequestMapping(value = "/admin/CultureListForm.cul")
	public ModelAndView AdminCultureList(HttpServletRequest request) throws Exception {
		System.out.println("1111111111111111111111");
		List<AdminCultureModel> AdminCultureList = adminCultureService.AdmincultureList();

		mav.addObject("adminCultureList", AdminCultureList); // 이 (adminReserveListForm) 이름으로 jsp 에서 사용한다!
		mav.setViewName("adminCultureList"); // 보여줄jsp 파일 이름!

		return mav;

	}

	//공연 상세보기
	@RequestMapping(value="/admin/CultureDetail.cul")
	public ModelAndView AdminCultureDetail(AdminCultureModel culture, HttpServletRequest request) {

		culture = adminCultureService.AdminCultureDetail(culture.getCULTURE_IDX());

		mav.addObject("adminCultureDetail", culture);
		mav.setViewName("adminCultureDetail");
		return mav;
	}
	

}
