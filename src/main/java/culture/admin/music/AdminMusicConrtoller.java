package culture.admin.music;

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

import culture.admin.music.AdminMusicModel;
import culture.admin.music.AdminMusicService;
import culture.admin.reserve.AdminReserveModel;

@Controller
public class AdminMusicConrtoller {


		@Resource(name="adminMusicService")  // 의존주입 해서 사용하기 위해
		
		private AdminMusicService adminMusicService;
		
		
		
		
		//goods admin 리스트
		@RequestMapping("/admin/MusicListForm.box")// 이요청이 들어오면 실행!
		public ModelAndView AdminMusicList(HttpServletRequest request) throws Exception{
			System.out.println("111111111111111111111111111111");
			ModelAndView mav = new ModelAndView();
			
			List<AdminMusicModel> AdminMusicList = adminMusicService.AdminMusicList();
			System.out.println("222222222222222222222222222222222");

				mav.addObject("adminMusicListForm", AdminMusicList); // 이 AdminReserveList 모델 객체를 "adminReserveListForm" 이름으로 adminReserveListForm.jsp 에서 사용한다! 
				mav.setViewName("adminMusicListForm");  // 보여줄jsp  파일 이름! 
				return mav;
			}
		
		@RequestMapping("/admin/MusicDetail.box")
		public ModelAndView AdminMusicDetail(HttpServletRequest request) throws Exception{
			
			System.out.println("111111111111111111111111111111");

			
			ModelAndView mav = new ModelAndView();

			
			int MUSIC_INDEX = Integer.parseInt(request.getParameter("MUSIC_INDEX"));


			AdminMusicModel adminMusicModel= adminMusicService.AdminMusicDetail(MUSIC_INDEX);
			System.out.println("222222222222222222222222222222222");

			
			mav.addObject("adminMusicDetail", adminMusicModel);
			mav.setViewName("adminMusicDetail");  

			return mav;
		
		}
	
		
}
