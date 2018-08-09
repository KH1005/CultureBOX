package culture.member.evaluation;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EvalController {
	
	@Resource(name="evalService")
	private EvalService evalService;
	
	@RequestMapping(value="/eval/EvalList.box")		//아이디 값을 세션으로 받아온다. 테스트를 위해 파라미터로 받는다.
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
	@RequestMapping(value="/eval/MusicEval.box")
	public String musicEval(Model model, EvalModel evalModel, HttpServletRequest request) {
		String music_index = request.getParameter("MUSIC_INDEX");
		String member_id = request.getParameter("MEMBER_ID");
		String star_count = request.getParameter("STAR_COUNT");
		int star = Integer.parseInt(star_count);
		int index = Integer.parseInt(music_index);
		
		evalModel.setMEMBER_ID(member_id);
		evalModel.setMUSIC_INDEX(index);
		evalModel.setSTAR_COUNT(star);
		
		int check = evalService.checkEval(evalModel);
		
		if(check == 1) {
			System.out.println("값이 있습니다.");
			return "fail";
		}else{
			evalService.insertEvalMusic(evalModel);
			return "success";
		}
		
	}
	
	@RequestMapping(value="/eval/EvalDetail.box")
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

}






































