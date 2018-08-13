package culture.member.evaluation;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.javafx.sg.prism.NGShape.Mode;

@Controller
public class EvalController {
	
	@Resource(name="evalService")
	private EvalService evalService;
	
	@RequestMapping(value="/eval/EvalList.cul")		//아이디 값을 세션으로 받아온다. 테스트를 위해 파라미터로 받는다.
	public String evalList(Model model, MemberModel memberModel, HttpServletRequest request) {
		String id = request.getParameter("id");	//아이디를 받아온다.
		
		memberModel.setMEMBER_ID(id);	//아이디를 빈에 저장하고
		
		List<MusicModel> musicList = evalService.selectMusicList(memberModel);	//서비스를 이용해서 디비에서 가져온다.
		List<String[]> songList  = new ArrayList<String[]>();
		
		//노래들
		for(int i=0;i<musicList.size();i++) {
			String song = musicList.get(i).getMUSIC_SONG();
			//System.out.println("song: "+song);
			String[] albumSong = song.split("|");
			songList.add(albumSong);
		}
		//System.out.println("size: "+musicList.size());
		model.addAttribute("musicList",musicList);
		model.addAttribute("songList",songList);
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
		System.out.println("music_index: "+music_index);
		
		evalModel.setMEMBER_ID(member_id);
		evalModel.setMUSIC_INDEX(Integer.parseInt(music_index));
		evalModel.setSTAR_COUNT(Integer.parseInt(star_count));
		
		int check = evalService.checkEval(evalModel);
		
		if(check == 1) {
			System.out.println("값이 있습니다.");
			map.put("code", "fail");
			return map;
		}else{
			System.out.println("in");
			evalService.insertEvalMusic(evalModel);
			String getStar = evalService.getStar(evalModel);
			System.out.println("star: "+getStar);
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
		
		String id = request.getParameter("MEMBER_ID");
		music = evalService.selectMusic(musicModel);
		
		evalModel.setMEMBER_ID(id);
		evalModel.setMUSIC_INDEX(music.getMUSIC_INDEX());
		
		String star = evalService.getStar(evalModel);
		if(star == null) {
			star = "0";
		}
		
		model.addAttribute("music", music);
		model.addAttribute("star",star);
		
		return "evalDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/eval/join.cul")
	 public String join() {
		System.out.println("in");
	   Map<String, Object> map = new HashMap<String, Object>();
	   map.put("name", "victolee");
	   map.put("age", 26);
     
	  return "hello";
	 
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
		
		for(int i=0;i<3;i++) {
			String addArtist = (String)artist.get(i).get("MUSIC_ARTIST");
			if(addArtist == null) {
				break;
			}
			top3artist.add(addArtist);
			System.out.println("artist: "+top3artist.get(i));
		}
		
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
		
		for(int i=0;i<3;i++) {
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
		
		
		for(int i=0;i<3;i++) {
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
		
		
		model.addAttribute("genre",recommendGenre);
		model.addAttribute("id",id);
		
		return "recommendGenreList";
		
	}
	
	



}






































