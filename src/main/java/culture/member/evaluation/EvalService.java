package culture.member.evaluation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service("evalService")
public class EvalService implements EvalDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTempate;
	

	@Override
	public List<MusicModel> selectMusicList(MemberModel memberModel) {
		
		return sqlSessionTempate.selectList("eval.evalMusicList",memberModel);
	}


	@Override
	public void insertEvalMusic(EvalModel evalModel) {
		sqlSessionTempate.insert("eval.insertEvalMusic",evalModel);
	}


	@Override
	public int checkEval(EvalModel evalModel) {
		return sqlSessionTempate.selectOne("eval.checkEval",evalModel); 
	}


	@Override
	public MusicModel selectMusic(MusicModel musicModel) {
		return sqlSessionTempate.selectOne("eval.selectMusic",musicModel);
	}


	@Override
	public String getStar(EvalModel evalModel) {
		return sqlSessionTempate.selectOne("eval.getStar", evalModel);
	}


	@Override
	public List<Map<String, Object>> getGenre(String MEMBER_ID) {
		return sqlSessionTempate.selectList("eval.likeGenre", MEMBER_ID);
	}


	@Override
	public List<Map<String, Object>> getArtist(String MEMBER_ID) {
		return sqlSessionTempate.selectList("eval.likeArtist",MEMBER_ID);
	}


	@Override
	public List<Map<String, Object>> getCountry(String MEMBER_ID) {
		return sqlSessionTempate.selectList("eval.likeCountry",MEMBER_ID);
	}


	@Override
	public List<MusicModel> getRecommendGenre(Map<String, Object> parameter) {
		return sqlSessionTempate.selectList("eval.recommendGenre",parameter);
	}


	@Override
	public List<MusicModel> getRecommendArtist(Map<String, Object> parameter) {
		return sqlSessionTempate.selectList("eval.recommendArtist", parameter);
	}


	@Override
	public List<MusicModel> getREcommendCountry(Map<String, Object> parameter) {
		return sqlSessionTempate.selectList("eval.recommendCountry",parameter);
	}


	@Override
	public MemberModel getMemberInfo(String MEMBER_ID) {
		return sqlSessionTempate.selectOne("eval.getMemberInfo",MEMBER_ID);
	}


	@Override
	public void insertMusicComment(MusicCommentModel musicCommentModel) {
		sqlSessionTempate.insert("eval.insertMusicComment",musicCommentModel);
	}


	@Override
	public List<Map<String, Object>> getMusicComment(int mcomment_musicidx) {
		return sqlSessionTempate.selectList("eval.getMusicComment",mcomment_musicidx);
	}


	@Override
	public MusicCommentModel getMyComment(Map<String, Object> parameter) {
		return sqlSessionTempate.selectOne("eval.getMyComment", parameter);
	}


	@Override
	public void deleteEvaluation(Map<String, Object> parameter) {
		sqlSessionTempate.delete("eval.deleteEvaluation", parameter);
		
	}


	@Override
	public void updateComment(MusicCommentModel musicCommentModel) {
		sqlSessionTempate.update("eval.updateComment",musicCommentModel);
		
	}


	@Override
	public void deleteComment(int MCOMMENT_IDX) {
		sqlSessionTempate.delete("eval.deleteComment",MCOMMENT_IDX);
	}


	@Override
	public List<MusicModel> getMusicAlbumList() {
		return sqlSessionTempate.selectList("eval.getMusicAlbumList");
	}


	@Override
	public List<MusicModel> getSearchList(String keyword) {
		return sqlSessionTempate.selectList("eval.getSearchList",keyword);
	}


	@Override
	public MusicCommentModel getMyCommentByidx(Map<String, Object> idx) {
		return sqlSessionTempate.selectOne("eval.getMyCommentByidx",idx);
	}


	@Override
	public List<Map<String, Object>> getMusicEvalInfo(Map<String, Object> parameter) {
		return sqlSessionTempate.selectList("eval.getMusicEvalInfo",parameter);
	}


	@Override
	public Map<String, Object> getMeanValue(Map<String, Object> parameter) {
		return sqlSessionTempate.selectOne("eval.getMeanValue",parameter);
	}
	
	
	
	
	

}
