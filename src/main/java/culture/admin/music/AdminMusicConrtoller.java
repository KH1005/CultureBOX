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

import com.sun.xml.internal.ws.wsdl.writer.document.StartWithExtensionsType;

import culture.admin.member.AdminMemberModel;
import culture.admin.music.AdminMusicModel;
import culture.admin.music.AdminMusicService;
import culture.admin.reserve.AdminReserveModel;
import culture.member.culture.CultureCommentModel;
import culture.member.evaluation.MusicModel;

@Controller
public class AdminMusicConrtoller {


	     
		@Resource(name="adminMusicService")  // �쓽議댁＜�엯 �빐�꽌 �궗�슜�븯湲� �쐞�빐
		private AdminMusicService adminMusicService;
		
		private int searchNum;
		private String isSearch;
		private static String uploadPath = "C:\\Spring\\App\\workspace\\cultureBOX\\src\\main\\webapp\\musicimg";

		
		
		
		 
		
		///////////////////////MUSIC 리스트//////////////////////////////////////////////
		@RequestMapping("/admin/MusicListForm.cul")// �씠�슂泥��씠 �뱾�뼱�삤硫� �떎�뻾!
		public ModelAndView AdminMusicList(HttpServletRequest request) throws Exception{
			System.out.println("111111111111111111111111111111");
			ModelAndView mav = new ModelAndView();
/*			System.out.println("isSearch=======>>>>>>>"+request.getParameter("isSearch"));
*/   
			
			List<AdminMusicModel> AdminMusicList = adminMusicService.AdminMusicList();
			System.out.println("222222222222222222222222222222222");

			isSearch = request.getParameter("isSearch");
/*			if(isSearch != null) isSearch = new String(isSearch.getBytes("8859_1"), "UTF-8");
*/
		      if(isSearch != null)
		      {
		         searchNum = Integer.parseInt(request.getParameter("searchNum"));

		         if(searchNum==0)
		            AdminMusicList = adminMusicService.musicSearch0(isSearch);
		         else if(searchNum==1)
			        AdminMusicList = adminMusicService.musicSearch1(isSearch);
		         else if(searchNum==2)
				    AdminMusicList = adminMusicService.musicSearch2(isSearch);


					System.out.println("3333333333333333333333333");

		         
		      mav.addObject("isSearch", isSearch);
		      mav.addObject("searchNum", searchNum);
		      
		      mav.addObject("adminMusicListForm", AdminMusicList); 
		      mav.setViewName("adminMusicListForm"); 
		      
		      
		      return mav;
		   }
			
		
				mav.addObject("adminMusicListForm", AdminMusicList); // �씠 AdminReserveList 紐⑤뜽 媛앹껜瑜� "adminReserveListForm" �씠由꾩쑝濡� adminReserveListForm.jsp �뿉�꽌 �궗�슜�븳�떎! 
				mav.setViewName("adminMusicListForm");  // 蹂댁뿬以꼓sp  �뙆�씪 �씠由�! 
				return mav;
			}
		
		
		
		
		
		///////////////////////상세보기//////////////////////////////////////////////
		@RequestMapping("/admin/MusicDetail.cul")
		public ModelAndView AdminMusicDetail(AdminMusicModel adminMusicModel, HttpServletRequest request) throws Exception{
			
			System.out.println("MusicDetail1111111");
			AdminMusicModel music = new AdminMusicModel();

			
			ModelAndView mav = new ModelAndView();
			
			
			music = adminMusicService.selectMusic(adminMusicModel);	//뮤직 정보를 가져온다.
			String[] songList = music.getMUSIC_SONG().split("/");

			
			int MUSIC_INDEX = Integer.parseInt(request.getParameter("MUSIC_INDEX"));
			

			AdminMusicModel AdminMusicModel = adminMusicService.AdminMusicDetail(MUSIC_INDEX);
			List<MusicCommentModel> list = adminMusicService.MusicCommentList(adminMusicModel.getMUSIC_INDEX());

			System.out.println("222222222222222222222222222222222");

			mav.addObject("musicCommentList",list);
			mav.addObject("songList",songList);

			mav.addObject("adminMusicModel", AdminMusicModel);
			mav.setViewName("adminMusicDetail");  

			return mav;
		
		}
		
		//////////////////////////////////////////수정폼띄우기 /////////////////////////////////
		@RequestMapping("/admin/MusicModifyForm.cul")
		public ModelAndView adminMusicModifyForm(AdminMusicModel music, HttpServletRequest request) {
			
			System.out.println("MusicModifyForm111111");

			ModelAndView mav = new ModelAndView();
	
			AdminMusicModel oneMusic = new AdminMusicModel();
			oneMusic = adminMusicService.AdminMusicModifyForm(music.getMUSIC_INDEX());
			
		
			 System.out.println("name: "+oneMusic.getMUSIC_INDEX()); 
			mav.addObject("adminMusicModify", oneMusic);
			mav.setViewName("adminMusicModify");

			return mav;
		}
		
		
		/////////////////////////////수정완료/////////////////////////////////////////////
		@RequestMapping(value = "/admin/MusicModify.cul")
		   public ModelAndView adminCultureModify(AdminMusicModel music, BindingResult result,
		         MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		   System.out.println("MusicModify111111111");
		   
			ModelAndView mav = new ModelAndView();
		   
		   
		   
		        if (multipartHttpServletRequest.getFile("file") != null){
		       
		 		   System.out.println("MusicModify222");

		           MultipartFile multipartFile = multipartHttpServletRequest.getFile("file");
		           String filename = multipartFile.getOriginalFilename();
		              if (filename != ""){ 
		            	  System.out.println("MusicModify33");
		                /* music.setMUSIC_SAVNAME(System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename());                   
		                String savimagename = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();*/
		            	String originalname = multipartFile.getOriginalFilename();
		            	System.out.println(originalname);
		            	String extraction = originalname.substring(originalname.indexOf("."));
		            	System.out.println(extraction);
		                music.setMUSIC_SAVNAME(System.currentTimeMillis()+"_"+"music"+extraction);                   
		                String savimagename = System.currentTimeMillis()+"_"+"music"+extraction; 
		                 try {
		                  FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
		               } catch (FileNotFoundException e) {
		                  e.printStackTrace();
		               } catch (IOException e) {
		                  e.printStackTrace();
		               }                                
		              }
		        }
		        else{
		           music.setMUSIC_SAVNAME(multipartHttpServletRequest.getParameter("MUSIC_SAVNAME"));
		        }
		        System.out.println("MusicModify444");
		        adminMusicService.AdminMusicModify(music);
		        System.out.println("music:" + music.getMUSIC_INDEX());
		      
		      mav.addObject("music", music);
		      mav.setViewName("redirect:/admin/MusicListForm.cul");
		      return mav;   
		   }
		
		
		
		///////////////////////MUSIC 삭제(댓글까지)//////////////////////////////////////////////
		@RequestMapping("/admin/MusicDelete.cul")
		public ModelAndView AdminMusicDelete(HttpServletRequest request) throws Exception {

			ModelAndView mav = new ModelAndView();
			System.out.println("00000000000000000000000000000000000");
			String MUSIC_INDEX = request.getParameter("MUSIC_INDEX");
			/*int MCOMMENT_MUSICIDX = Integer.parseInt(request.getParameter("MCOMMENT_MUSICIDX"));
			int MUSIC_INDEX = Integer.parseInt(request.getParameter("MUSIC_INDEX"));*/
			System.out.println("MusicDelete 111111111111111111");
			adminMusicService.AdminEvalDelete(MUSIC_INDEX);
			adminMusicService.AdminMusicCommentDelete(MUSIC_INDEX);
			adminMusicService.AdminMusicDelete(MUSIC_INDEX);
			System.out.println("22222222222222222222222222222222222222");

			mav.setViewName("redirect:/admin/MusicListForm.cul");
			return mav;
		}
		

		/*/////////////////////////////////////음악 등록 폼/////////////////////////////////////*/
		@RequestMapping("/admin/MusicJoinForm.cul")
		public ModelAndView MusicJoinForm(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			
			List<AdminMusicModel> AdminMusicList = adminMusicService.AdminMusicList();

			
			mav.addObject("adminMusicJoinForm", AdminMusicList);
			mav.setViewName("adminMusicJoinForm");
			return mav;
		}
		
		
		
		/////////////////////////////////등록 완료 ///////////////////////////////////////////
		@RequestMapping("/admin/MusicJoin.cul")
		public String MusicJoin(AdminMusicModel adminMusicModel,  BindingResult result,
				MultipartHttpServletRequest multipartHttpServletRequest) throws Exception, Exception{
			System.out.println("444444444444444444");
			ModelAndView mav = new ModelAndView();
			
			System.out.println("music_artist: "+adminMusicModel.getMUSIC_ARTIST());

			/*踰⑤━�뜲�씠�듃
			new MusicValidator().validate(adminMusicModel, result);
			if(result.hasErrors()) {
				mav.setViewName("adminMusicJoinForm");
				return "adminMusicJoinForm";
			}*/
			
		/*	以꾨컮轅�
			String content = reviewModel.getContent().replaceAll("\r\n", "<br />");
			reviewModel.setContent(content);
					*/
			//�뾽濡쒕뱶
			MultipartFile multipartFile = multipartHttpServletRequest.getFile("file");
	    	String filename = multipartFile.getOriginalFilename();
	    	System.out.println("99999999999999999999999");
	        	if (filename != ""){ 
				   /* adminMusicModel.setMUSIC_SAVNAME(System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename());
				    String savimagename = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();*/
	        		
	        		String originalname = multipartFile.getOriginalFilename();
	            	System.out.println(originalname);
	            	String extraction = originalname.substring(originalname.indexOf("."));
	            	System.out.println(extraction);
	        		
	        		
	            	adminMusicModel.setMUSIC_SAVNAME(System.currentTimeMillis()+"_"+"music"+extraction);                   
		                String savimagename = System.currentTimeMillis()+"_"+"music"+extraction; 
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
			
			
			System.out.println("湲��벐湲� �떆�옉");
			
			adminMusicModel.setContent(adminMusicModel.getContent().replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
			
			String imgName = adminMusicModel.getMUSIC_ALBUM();
			
			int index1 = imgName.indexOf("album_img_upload/");
			int index2 = imgName.indexOf("album_img_upload/");
			index1 += 15;
			index2 += 32;
			
			System.out.println(index1+"  1踰덉씤�뜲湲�");
			System.out.println(index2+"  2踰덉씤�뜳�뒪");
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
		
			mav.setViewName("redirect:/admin/MusicDetail.cul?MUSIC_INDEX="+musicCommentModel.getMCOMMENT_MUSICIDX());
		
			return mav;
		
		}
		

//		@RequestMapping(value = "/admin/MusicModifyForm.cul")
//		public ModelAndView adminMusicModifyForm(AdminMusicModel music, HttpServletRequest request) {
//			
//			AdminMusicModel oneMusic = new AdminMusicModel();
//			oneMusic = adminMusicService.AdminMusicModify(music.getMUSIC_INDEX());
//			
//			mav.addObject("music", oneMusic);
//			mav.setViewName("adminMusicModify");
//
//			return mav;
//		}
		

		
		
		
}
