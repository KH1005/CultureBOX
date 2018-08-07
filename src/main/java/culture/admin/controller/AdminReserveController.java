package culture.admin.controller;


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


import culture.admin.model.AdminReserveModel;
import culture.admin.service.AdminReserveService;



@Controller
@RequestMapping("/admin")
public class AdminReserveController {
	@Resource
	private AdminService adminService;
	
	@Resource
	private GoodsService goodsService;
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private NoticeService noticeService;
	
	@Resource
	private Pet_imgService pet_imgService;
	
	@Resource
	private PetService petService;
	
	@Resource
	private QnAService qnAService;
	
	@Resource
	private ReviewService reviewService;
	
	String uploadPath = "E:\\app3\\d_pro\\src\\main\\webapp\\resources\\goods_upload\\";
	
	//페이징
	private int searchNum;
	private String isSearch;
	
	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 7;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value="admin.dog")
	public String mainForm(){
		return "adminForm";
	}
	
	//goods admin 리스트
	@RequestMapping("goodsadminList.dog")
	public ModelAndView goodsList(HttpServletRequest request) throws Exception{
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		List<GoodsModel> goodslist=adminService.goodsList();
		
		isSearch = request.getParameter("isSearch");
		if(isSearch != null)
		{
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if(searchNum==0)//상품이름
				goodslist = adminService.goodsSearch0(isSearch);
			else if(searchNum == 1)//글번호
				goodslist = adminService.goodsSearch1(isSearch);
			else if(searchNum == 2)//카테고리
				goodslist = adminService.goodsSearch2(isSearch);
			else if(searchNum == 3)//goods_best 신상, 추천,베스트
				goodslist = adminService.goodsSearch3(isSearch);
		
			totalCount = goodslist.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "goodsadminList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
		
			int lastCount = totalCount;
		
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			goodslist = goodslist.subList(page.getStartCount(), lastCount);
		
			mav.addObject("isSearch", isSearch);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("goodsList", goodslist);
			mav.setViewName("goodsadminList");
			return mav;
		}
		
		totalCount = goodslist.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "goodsadminList");
		pagingHtml=page.getPagingHtml().toString(); 
		

		int lastCount = totalCount;
		 
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		 
		goodslist = goodslist.subList(page.getStartCount(), lastCount);
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		
		mav.addObject("goodsList", goodslist);
		mav.setViewName("goodsadminList");
		
		return mav;
	}
