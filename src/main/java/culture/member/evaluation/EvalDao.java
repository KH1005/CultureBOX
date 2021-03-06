package culture.member.evaluation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<Map<String, Object>> getGenre(String MEMBER_ID);
	
	public List<Map<String, Object>> getArtist(String MEMBER_ID);
	
	public List<Map<String, Object>> getCountry(String MEMBER_ID);
	
	public List<MusicModel> getRecommendGenre(Map<String, Object> parameter);
	
	public List<MusicModel> getRecommendArtist(Map<String, Object> parameter);
	
	public List<MusicModel> getREcommendCountry(Map<String, Object> parameter);
	
	public MemberModel getMemberInfo(String MEMBER_ID);
	
	public void insertMusicComment(MusicCommentModel musicCommentModel);
	
	public List<Map<String, Object>> getMusicComment(int mcomment_musicidx);
	
	public MusicCommentModel getMyComment(Map<String, Object> parameter);

	public void deleteEvaluation(Map<String, Object> parameter);
	
	public void updateComment(MusicCommentModel musicCommentModel);
	
	public void deleteComment(int MCOMMENT_IDX);
	
	public List<MusicModel> getMusicAlbumList();
	
	public List<MusicModel> getSearchList(String keyword);
	
	public MusicCommentModel getMyCommentByidx(Map<String, Object> parameter);
	
	public List<Map<String , Object>> getMusicEvalInfo(Map<String, Object> parameter);
	
	public Map<String, Object> getMeanValue(Map<String, Object> parameter);

}















