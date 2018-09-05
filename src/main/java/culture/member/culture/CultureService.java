package culture.member.culture;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class CultureService implements CultureDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<CultureModel> cultureList(){ //리스트 가져오기
		return sqlSessionTemplate.selectList("culture.selectCulture_ALL");
	}
	@Override
	public CultureModel cultureDetail(int CULTURE_IDX) { //상세보기
		return sqlSessionTemplate.selectOne("culture.selectCulture_ONE",CULTURE_IDX);
	}
	@Override
	public List<CultureCommentModel> cultureCommentList(int COMMENT_CULTUREIDX) { //댓글 리스트 가져오기
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("culture.selectCultureCommentList",COMMENT_CULTUREIDX);
	}
	@Override
	public Object writeCultureComment(CultureCommentModel cultureCommentModel) { //댓글 작성하기
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("culture.writeCultureComment",cultureCommentModel);
	}
	@Override
	public Object deleteCultureComment(CultureCommentModel cultureCommentModel) { //댓글 삭제하기
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("culture.deleteCultureComment",cultureCommentModel);
	}
	@Override
	public void modifyCultureComment(CultureCommentModel cultureCommentModel) {
		  // TODO Auto-generated method stub
	      sqlSessionTemplate.update("culture.modifyCultureComment",cultureCommentModel);
	   }
	
	
	

}
