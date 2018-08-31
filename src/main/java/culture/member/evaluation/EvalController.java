package culture.member.evaluation;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.Literal;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.ls.LSException;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.sun.javafx.sg.prism.NGShape.Mode;
import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import sun.rmi.transport.proxy.HttpReceiveSocket;

@Controller
public class EvalController {
	
	@Resource(name="evalService")
	private EvalService evalService;
	
	@RequestMapping(value="/eval/EvalList.cul")		//아이디 값을 세션으로 받아온다. 테스트를 위해 파라미터로 받는다.
	public String evalList(Model model, MemberModel memberModel, HttpServletRequest request) {
		String id = request.getParameter("id");	//아이디를 받아온다.
		String issearch = request.getParameter("issearch");
		memberModel.setMEMBER_ID(id);	//아이디를 빈에 저장하고
		List<MusicModel> musicList;
		
		if(issearch != null) {
			//찾는 쿼리 넣어준다.
			musicList = evalService.getSearchList(issearch);
			
			Collections.shuffle(musicList);
			
			model.addAttribute("musicList",musicList);
			model.addAttribute("id",id);
			return "evalList";
			
		}
		musicList = evalService.selectMusicList(memberModel);	//서비스를 이용해서 디비에서 가져온다.
		
		Collections.shuffle(musicList);
		model.addAttribute("musicList",musicList);
		model.addAttribute("id",id);
		
		return "evalList";
	}
	
	@ResponseBody	
	@RequestMapping(value="/eval/MusicEval.cul")
	public Map<String, Object> musicEval(Model model, EvalModel evalModel, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String music_index = request.getParameter("MUSIC_INDEX");
		String member_id = request.getParameter("MEMBER_ID");
		String star_count = request.getParameter("STAR_COUNT");
//		int star = Integer.parseInt(star_count);
//		int index = Integer.parseInt(music_index);
		
		evalModel.setMEMBER_ID(member_id);
		evalModel.setMUSIC_INDEX(Integer.parseInt(music_index));
		evalModel.setSTAR_COUNT(Integer.parseInt(star_count));
		
		int check = evalService.checkEval(evalModel);
		if(check == 1) {
			System.out.println("값이 있습니다.");
			map.put("code", "fail");
			return map;
		}else{
			evalService.insertEvalMusic(evalModel);
			String getStar = evalService.getStar(evalModel);
			map.put("code", "success");
			map.put("star", getStar);
			return map;
		}
		
	}
	
	/*
	 *  	
	 * 		{
	 * 			check: "success",
	 * 			star: "1,2,3,4,5"
	 * 		}
	 * 	
	 * 
	 */
	
	@RequestMapping(value="/eval/EvalDetail.cul")
	public String evalDetail(MusicModel musicModel, Model model, HttpServletRequest request) {
		MusicModel music = new MusicModel();
		EvalModel evalModel = new EvalModel();
		MemberModel memberModel = new MemberModel();
		HttpSession session = request.getSession();
		
		String member_id = (String)session.getAttribute("id");
		String id = request.getParameter("MEMBER_ID");
		memberModel = evalService.getMemberInfo(id);
		music = evalService.selectMusic(musicModel);	//뮤직 정보를 가져온다.
		
		//선택한 장르의 음악을 5개 가져온다.
		Map<String, Object> recparameter = new HashMap<String, Object>();
		recparameter.put("MEMBER_ID", id);
		recparameter.put("MUSIC_GENRE", music.getMUSIC_GENRE());
		List<MusicModel> recMusic = evalService.getRecommendGenre(recparameter);
		List<MusicModel> recGenre = new ArrayList<MusicModel>();
		
		for(int i=0;i<5;i++) {
			if(recMusic.size() <= i) {
				break;
			}
			recGenre.add(recMusic.get(i));
		}
		
		Collections.shuffle(recGenre);
		
		String[] songList = music.getMUSIC_SONG().split("/");
		
		evalModel.setMEMBER_ID(id);
		evalModel.setMUSIC_INDEX(music.getMUSIC_INDEX());
		
		String star = evalService.getStar(evalModel);
		if(star == null) {
			star = "0";
		}
		//코멘트 리스트 불러오기
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("MCOMMENT_MUSICIDX", music.getMUSIC_INDEX());
		parameter.put("MCOMMENT_WRITERID", id);
		List<Map<String, Object>> commentList = evalService.getMusicComment(music.getMUSIC_INDEX());
		MusicCommentModel myComment = evalService.getMyComment(parameter);
		
		model.addAttribute("mycomment", myComment);
		model.addAttribute("songList",songList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("music", music);
		model.addAttribute("star",Integer.parseInt(star));
		model.addAttribute("member",memberModel);
		model.addAttribute("id",id);
		model.addAttribute("recGenre",recGenre);
		
		return "evalDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/eval/CommentList.cul")
	public List<Map<String, Object>> commentList(HttpServletRequest request){

		int idx = Integer.parseInt(request.getParameter("MUSIC_INDEX"));
		List<Map<String, Object>> commentList = evalService.getMusicComment(idx);
		
		List<Map<String, Object>> cList = new ArrayList<>();
		for(int i =0;i<commentList.size();i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", commentList.get(i).get("MCOMMENT_WRITERID")); 
			map.put("content",commentList.get(i).get("MCOMMENT_CONTENT"));
			map.put("index", commentList.get(i).get("MCOMMENT_IDX"));
			map.put("musicidx",commentList.get(i).get("MCOMMENT_MUSICIDX"));
			cList.add(map);
			
		}
		
		return cList;
	} 
	
	@ResponseBody
	@RequestMapping("/eval/join.cul")
	public String join() {
		return "asd";
	}

	
	
	@RequestMapping(value="/eval/MusicAlbumList.cul")
	@ResponseBody
	public List<String> musicAlbumList(HttpServletRequest request){
		List<MusicModel> musicList = evalService.getMusicAlbumList();
		String keyword = request.getParameter("value");
		
		if(keyword==null || keyword.equals("")) {
			return Collections.EMPTY_LIST;
		}
		List<String> result = new ArrayList<String>();
		for(int i=0;i<musicList.size();i++) {
			if(musicList.get(i).getMUSIC_ALBUM().startsWith(keyword)) {
				result.add(musicList.get(i).getMUSIC_ALBUM());
			}
		}
		
		
		List<Map<String, Object>> musicAlbumList = new ArrayList<Map<String, Object>>();
		for(int i =0;i<musicList.size();i++) {
			Map<String, Object> music = new HashMap<String, Object>();
			music.put("music", musicList.get(i).getMUSIC_ALBUM());
			musicAlbumList.add(music);
		}
		
		return result;
//		List<MusicModel> music = evalService.getMusicAlbumList();
//		List<String> musicList = new ArrayList<>();
//		for(int i=0;i<music.size();i++) {
//			musicList.add(music.get(i).getMUSIC_ALBUM());
//		}
//		return musicList;
		
	}
	
	@RequestMapping(value="/eval/RecommendArtistList.cul")
	public String recommendArtistList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		Map<String, Object> parameter = new HashMap<String, Object>();
		
		parameter.put("MEMBER_ID", id);
		
		List<Map<String, Object>> artist = evalService.getArtist(id);
		List<MusicModel> recommendArtist = new ArrayList<MusicModel>();
		
		List<String> top3artist = new ArrayList<String>();
		
		for(int i=0;i<artist.size();i++) {
			String addArtist = (String)artist.get(i).get("MUSIC_ARTIST");
			if(addArtist == null) {
				break;
			}
			top3artist.add(addArtist);
			System.out.println("artist: "+top3artist.get(i));
		}
		Collections.shuffle(recommendArtist);
		model.addAttribute("artist",recommendArtist);
		model.addAttribute("id",id);
		
		return "recommendArtistList";
	}
	
	@RequestMapping(value="/eval/RecommendCountryList.cul")
	public String recommendCountryList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("MEMBER_ID", id);
		List<Map<String, Object>> country = evalService.getCountry(id);
		
		List<String> top3country = new ArrayList<String>();
		
		for(int i=0;i<country.size();i++) {
			String addCountry = (String)country.get(i).get("MUSIC_COUNTRY");
			if(addCountry == null) {
				break;
			}
			top3country.add(addCountry);
			System.out.println("country: "+top3country.get(i));
		
		}
		
		List<MusicModel> recommendCountry = new ArrayList<MusicModel>();
		
		for(int i=0;i<top3country.size();i++) {
			if(top3country.get(i)==null) {
				break;
			}
			parameter.put("MUSIC_COUNTRY", top3country.get(i));
			
			List<MusicModel> nara = evalService.getREcommendCountry(parameter); //순위대로 선호하는 국가를 뽑는다. 
			recommendCountry.addAll(nara);										//순위대로 검색한 국가리스트를 모두 더한다.
		}
		Collections.shuffle(recommendCountry);
		model.addAttribute("country",recommendCountry);
		model.addAttribute("id",id);
		return "recommendCountryList";
	}
	
	
	@RequestMapping(value="/eval/RecommendGenreList.cul")
	public String recommendGenreList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		Map<String, Object> parameter = new HashMap<String, Object>();
		
		parameter.put("MEMBER_ID", id);

		List<Map<String, Object>> genre = evalService.getGenre(id);
		List<String> top3genre = new ArrayList<String>();
		
		
		for(int i=0;i<genre.size();i++) {
			String addGenre = (String)genre.get(i).get("MUSIC_GENRE");
			if(addGenre == null) {
				break;
			}
			top3genre.add(addGenre);
			System.out.println("genre: "+top3genre.get(i));
		}
		
		List<MusicModel> recommendGenre = new ArrayList<MusicModel>();
		
		//id = kh10005
		for(int i=0;i<top3genre.size();i++) {
			parameter.put("MUSIC_GENRE", top3genre.get(i));
			if(top3genre.get(i) == null) {
				break;
			}
			List<MusicModel> music = evalService.getRecommendGenre(parameter); //순위에 맞는 장르에 해당하는 뮤직 리스트를 보여준다.
			recommendGenre.addAll(music);	//1,2,3위 장르에 맞는 추천 음악리스트를 모두 불러온다.
		}
		/*
		 * genre: 1.rock, 2.edm, 3.ballard
		 * 
		 * artist: 1.oasis, 2.kasabian , 3.dua lipa
		 * 
		 * country: 1.US, 2.UK, 3.KR
		 */
		
		Collections.shuffle(recommendGenre);
		model.addAttribute("genre",recommendGenre);
		model.addAttribute("id",id);
		
		return "recommendGenreList";
		
	}
	
	/*
	 * 이름과 아이디로 찾는다. 코멘트가 있으면 업데이트해서 수정하고 찾았는데 없으면 인서트해서 넣는다.
	 */
	
	@ResponseBody
	@RequestMapping(value="/eval/CommentWrite.cul" , method=RequestMethod.POST)
	public Map<String, Object> commentWrite(MusicCommentModel musicCommentModel, HttpServletRequest request, Model model) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		Map<String, Object> parameter = new HashMap<String, Object>();
		
		MusicCommentModel musicinfo = new MusicCommentModel();		//인서트한 뮤직정보를 얻어온다.
		parameter.put("MCOMMENT_MUSICIDX", musicCommentModel.getMCOMMENT_MUSICIDX());
		parameter.put("MCOMMENT_WRITERID", musicCommentModel.getMCOMMENT_WRITERID());
		
		evalService.insertMusicComment(musicCommentModel); //댓글 쓰기
		musicinfo = evalService.getMyComment(parameter);	//쓴 댓글 바로 가져오기
		
		model.addAttribute("musicinfo", musicinfo);
		
		map.put("code", "success");
		map.put("id", musicinfo.getMCOMMENT_WRITERID());
		map.put("content", musicinfo.getMCOMMENT_CONTENT());
		map.put("index", musicinfo.getMCOMMENT_IDX());
		map.put("musicidx",musicinfo.getMCOMMENT_MUSICIDX());
		//return "redirect:EvalDetail.cul?MUSIC_INDEX="+music_index+"&MEMBER_ID="+member_id;
		return map;
	}
	
	//코멘트를 삭제한다. 
	@ResponseBody
	@RequestMapping(value="/eval/CommentDelete.cul")
	public Map<String, Object> commentDelete(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String , Object> parameter = new HashMap<String, Object>();
		int idx = Integer.parseInt(request.getParameter("MCOMMENT_IDX"));
		try {
			parameter.put("MCOMMENT_IDX", idx);
			MusicCommentModel mcModel = evalService.getMyCommentByidx(parameter);
			evalService.deleteComment(idx);
			map.put("code", "success");
			map.put("id", mcModel.getMCOMMENT_WRITERID());
			return map;
		}catch (Exception e) {
			map.put("code", "fail");
			return map;
		}
		
	}
	
	//수정하고 값을 바꿔주면 된다.
	@ResponseBody
	@RequestMapping(value="/eval/CommentModify.cul", method=RequestMethod.POST)
	public Map<String, Object> commentModify(MusicCommentModel musicCommentModel){
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			evalService.updateComment(musicCommentModel); //댓글 수정
			
			map.put("code", "success");
			map.put("id", musicCommentModel.getMCOMMENT_WRITERID());
			map.put("content", musicCommentModel.getMCOMMENT_CONTENT());
			map.put("index", musicCommentModel.getMCOMMENT_IDX());
			map.put("musicidx",musicCommentModel.getMCOMMENT_MUSICIDX());
			
		}catch (Exception e) {
			return map;
		}
		
		
		return map;
	}

	@RequestMapping(value="/eval/DeleteEvaluation.cul")
	public String deleteEvaluation(HttpServletRequest request, Model model){
		Map<String, Object>	parameter = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		parameter.put("MEMBER_ID", request.getParameter("MEMBER_ID"));
		parameter.put("MUSIC_INDEX", request.getParameter("MUSIC_INDEX"));
		
		try {
			evalService.deleteEvaluation(parameter);
			map.put("code", "success");
		}catch(Exception e) {
			map.put("code", "fail");
		}
				
		return "redirect:EvalDetail.cul?MUSIC_INDEX="+parameter.get("MUSIC_INDEX")+"&MEMBER_ID="+parameter.get("MEMBER_ID");
	}
	
	


}






































