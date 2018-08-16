package culture.admin.music;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;



import culture.admin.music.AdminMusicModel;
import culture.admin.music.AdminMusicService;
import culture.admin.reserve.AdminReserveModel;
import culture.member.culture.CultureCommentModel;

@Controller
public class AdminMusicConrtoller {


	     
		@Resource(name="adminMusicService")  // 의존주입 해서 사용하기 위해
		
		private static String uploadPath = "C:\\Spring\\cultureBOX\\src\\main\\webapp\\WEB-INF\\";

		
		private AdminMusicService adminMusicService;
		
		
		
		
		///////////////////////MUSIC 리스트//////////////////////////////////////////////
		@RequestMapping("/admin/MusicListForm.cul")// 이요청이 들어오면 실행!
		public ModelAndView AdminMusicList(HttpServletRequest request) throws Exception{
			System.out.println("111111111111111111111111111111");
			ModelAndView mav = new ModelAndView();
			
			List<AdminMusicModel> AdminMusicList = adminMusicService.AdminMusicList();
			System.out.println("222222222222222222222222222222222");

				mav.addObject("adminMusicListForm", AdminMusicList); // 이 AdminReserveList 모델 객체를 "adminReserveListForm" 이름으로 adminReserveListForm.jsp 에서 사용한다! 
				mav.setViewName("adminMusicListForm");  // 보여줄jsp  파일 이름! 
				return mav;
			}
		
		///////////////////////MUSIC 상세보기(댓글추가)//////////////////////////////////////////////
		@RequestMapping("/admin/MusicDetail.cul")
		public ModelAndView AdminMusicDetail(HttpServletRequest request) throws Exception{
			
			System.out.println("111111111111111111111111111111");
		
			
			ModelAndView mav = new ModelAndView();

			
			int MUSIC_INDEX = Integer.parseInt(request.getParameter("MUSIC_INDEX"));


			AdminMusicModel adminMusicModel= adminMusicService.AdminMusicDetail(MUSIC_INDEX);
			List<MusicCommentModel> list = adminMusicService.MusicCommentList(adminMusicModel.getMUSIC_INDEX());

			System.out.println("222222222222222222222222222222222");

			mav.addObject("musicCommentList",list);

			mav.addObject("adminMusicDetail", adminMusicModel);
			mav.setViewName("adminMusicDetail");  

			return mav;
		
		}
		
		
		///////////////////////MUSIC 삭제//////////////////////////////////////////////
		/*@RequestMapping("/admin/MusicDelete.cul")
		public ModelAndView AdminMusicDelete(HttpServletRequest request) throws Exception {

			ModelAndView mav = new ModelAndView();
			
			int MUSIC_INDEX = Integer.parseInt(request.getParameter("MUSIC_INDEX"));
			
			adminMusicService.AdminMusicDelete(MUSIC_INDEX);
			
			mav.setViewName("redirect:/admin/MusicListForm.cul");
			return mav;
		}*/
		

		/*/////////////////////////////////////글쓰기 폼 이동/////////////////////////////////////*/
		@RequestMapping("/admin/MusicJoinForm.cul")
		public ModelAndView MusicJoinForm(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			
			List<AdminMusicModel> AdminMusicList = adminMusicService.AdminMusicList();

			
			mav.addObject("adminMusicJoinForm", AdminMusicList);
			mav.setViewName("adminMusicJoinForm");
			return mav;
		}
		
		
		
		/////////////////////////////////글쓰기 ///////////////////////////////////////////
		@RequestMapping("/admin/MusicJoin.cul")
		public String MusicJoin(AdminMusicModel adminMusicModel,  BindingResult result,
				MultipartHttpServletRequest multipartHttpServletRequest) throws Exception, Exception{
			System.out.println("444444444444444444");
			ModelAndView mav = new ModelAndView();
			
			System.out.println("music_artist: "+adminMusicModel.getMUSIC_ARTIST());

			/*벨리데이트
			new MusicValidator().validate(adminMusicModel, result);
			if(result.hasErrors()) {
				mav.setViewName("adminMusicJoinForm");
				return "adminMusicJoinForm";
			}*/
			
		/*	줄바꿈
			String content = reviewModel.getContent().replaceAll("\r\n", "<br />");
			reviewModel.setContent(content);
					*/
			//업로드
			MultipartFile multipartFile = multipartHttpServletRequest.getFile("file");
	    	String filename = multipartFile.getOriginalFilename();
	    	System.out.println("99999999999999999999999");
	        	if (filename != ""){ 
				    adminMusicModel.setMUSIC_SAVNAME(System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename());
				    String savimagename = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();
			        FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
			        adminMusicModel.setMUSIC_SAVNAME(savimagename);
			        System.out.println("0000000000000000000000");
	        	}else{
	        		adminMusicModel.setMUSIC_SAVNAME("NULL");		
	        	}
	        	
				System.out.println("5555555555555555555555");

				adminMusicService.AdminMusicinsert(adminMusicModel);

			System.out.println("66666666666666666666663");

			mav.setViewName("redirect:MusicListForm.cul");
			
			return "redirect:MusicListForm.cul";
		}
		/*@RequestMapping("/admin/MusicJoin.cul")
		public String write(Model model, AdminMusicModel adminMusicModel ) {
			
			
			System.out.println("글쓰기 시작");
			
			adminMusicModel.setContent(adminMusicModel.getContent().replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
			
			String imgName = adminMusicModel.getMUSIC_ALBUM();
			
			int index1 = imgName.indexOf("album_img_upload/");
			int index2 = imgName.indexOf("album_img_upload/");
			index1 += 15;
			index2 += 32;
			
			System.out.println(index1+"  1번인데긋");
			System.out.println(index2+"  2번인덱스");
			System.out.println(imgName);
			imgName = imgName.substring(index1, index2);
			System.out.println(imgName);
			
			
			adminMusicModel.setMUSIC_SAVNAME(imgName);
			adminMusicService.AdminMusicinsert(adminMusicModel);
			
			
			return "redirect:MusicListForm.cul";
		}*/
		/////////////////////////댓글 삭제//////////////////////////////////
		@RequestMapping("/admin/deleteMusicComment.cul")
		public ModelAndView commentDelete(HttpServletRequest request, MusicCommentModel musicCommentModel ){
		
			ModelAndView mav=new ModelAndView();
			System.out.println("value: "+musicCommentModel.getMCOMMENT_IDX());
			adminMusicService.DeleteMusicComment(musicCommentModel);
		
			mav.setViewName("redirect:MusicDetail.cul?MUSIC_INDEX="+musicCommentModel.getMCOMMENT_MUSICIDX());
		
			return mav;
		
		}
		
		
		
		
}
