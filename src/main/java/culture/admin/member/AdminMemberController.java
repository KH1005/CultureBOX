package culture.admin.member;

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

import culture.admin.member.AdminMemberModel;
import culture.admin.member.AdminMemberService;
import culture.admin.member.Paging;

@Controller
public class AdminMemberController {

	@Resource(name = "adminMemberService")
	private AdminMemberService adminMemberService;

	// 페이징
	private int searchNum;
	private String isSearch;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 7;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	ModelAndView mav = new ModelAndView();

	// 회원 리스트
	@RequestMapping(value = "/admin/AdminMemberList.cul")
	public ModelAndView AdminMemberList(HttpServletRequest request) throws Exception {
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }

		List<AdminMemberModel> AdminMemberList = adminMemberService.AdminmemberList();
		/* System.out.println("size: "+AdminMemberlist.size()); */
		
		isSearch = request.getParameter("isSearch");
		if(isSearch != null)
		{
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if(searchNum==0)
				AdminMemberList = adminMemberService.memberSearch0(isSearch);
		
			totalCount = AdminMemberList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminMemberList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
		
			int lastCount = totalCount;
		
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			
			AdminMemberList = AdminMemberList.subList(page.getStartCount(), lastCount);
			
			
		mav.addObject("isSearch", isSearch);
		mav.addObject("searchNum", searchNum);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("adminMemberList", AdminMemberList); // 이 (adminReserveListForm) 이름으로 jsp 에서 사용한다!
		mav.setViewName("adminMemberList"); // 보여줄jsp 파일 이름!

		return mav;
	}
		totalCount = AdminMemberList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "AdminMemberList");
		pagingHtml=page.getPagingHtml().toString(); 
		

		int lastCount = totalCount;
		 
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		 
		AdminMemberList = AdminMemberList.subList(page.getStartCount(), lastCount);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("adminMemberList", AdminMemberList);
		mav.setViewName("adminMemberList");
		
		return mav;
	}
	

	// 회원수정폼
	@RequestMapping(value = "/admin/MemberModifyForm.cul")
	public ModelAndView adminModifyForm(AdminMemberModel member, HttpServletRequest request) {
		System.out.println("test : " + member.getMEMBER_ID());
		System.out.println("test : " + member.getMEMBER_NAME());
		System.out.println("test : " + member.getMEMBER_PASSWORD());
		System.out.println("test : " + member.getMEMBER_EMAIL());
		AdminMemberModel oneMember = new AdminMemberModel();
		oneMember = adminMemberService.getMember(member.getMEMBER_ID());
		
		System.out.println("member :" +oneMember.getMEMBER_ID());
		mav.addObject("member", oneMember);
		mav.setViewName("adminModify");

		return mav;
	}

	//회원 수정
	@RequestMapping(value = "/admin/MemberModify.cul")
	public ModelAndView adminMemberModify(AdminMemberModel member, HttpServletRequest request) {
		

		adminMemberService.AdminUpdateMember(member);

		mav.setViewName("redirect:/admin/AdminMemberList.cul");
		return mav;
	}

	// 회원삭제
	@RequestMapping(value = "/admin/MemberDelete.cul")
	public ModelAndView AdminMemberDelete(HttpServletRequest request) throws Exception {

		String MEMBER_ID = request.getParameter("MEMBER_ID");

		adminMemberService.adminEvalDelete(MEMBER_ID);
		adminMemberService.adminReserveDelete(MEMBER_ID);
		adminMemberService.adminCommentDelete(MEMBER_ID);
		adminMemberService.adminMemberDelete(MEMBER_ID);
		mav.setViewName("redirect:/admin/AdminMemberList.cul");

		return mav;
	}

}
