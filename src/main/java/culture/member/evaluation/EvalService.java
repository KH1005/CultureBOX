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
		return sqlSessionTempate.selectList("eval.recommendGenre", MEMBER_ID);
	}


	@Override
	public List<Map<String, Object>> getArtist(String MEMBER_ID) {
		return sqlSessionTempate.selectList("eval.recommendArtist",MEMBER_ID);
	}


	@Override
	public List<Map<String, Object>> getCountry(String MEMBER_ID) {
		return sqlSessionTempate.selectList("eval.recommendCountry",MEMBER_ID);
	}
	
	
	
	
	

}
