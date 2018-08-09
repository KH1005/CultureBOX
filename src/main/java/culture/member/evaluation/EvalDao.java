package culture.member.evaluation;

import java.util.List;

/*
 * 
 * 1.내가 평가한 음악들을 제외하고 디비에서 가져온다.
 * 
 * 
 */

public interface EvalDao {
	
	public List<MusicModel> selectMusicList(MemberModel memberModel);
	
	public void insertEvalMusic(EvalModel evalModel); 
	
	public int checkEval(EvalModel evalModel);
	
	public MusicModel selectMusic(MusicModel musicModel);
	
	public String getStar(EvalModel evalModel);
	

}
