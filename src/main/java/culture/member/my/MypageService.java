package culture.member.my;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import culture.member.evaluation.MemberModel;

@Service("mypageService")
public class MypageService implements MypageDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Map<String, Object>> reserveList(Map<String, Object> parameter) {
		System.out.println(parameter.get("RESERVE_ID"));
		return sqlSessionTemplate.selectList("mypage.reserveList",parameter);
	}

	@Override
	public void updateQRcode(Map<String, Object> parameter) {
		sqlSessionTemplate.update("mypage.updateQRcode",parameter);
		
	}

	@Override
	public MemberModel getMember(String MEMBER_ID) {
		return sqlSessionTemplate.selectOne("member.getMember", MEMBER_ID);
	}

	@Override
	public Object memberModify(MemberModel memberModel) {
		return sqlSessionTemplate.update("member.updateMember", memberModel);
	}

	@Override
	public Object memberDelete(String MEMBER_ID) {
		return sqlSessionTemplate.delete("member.deleteMember", MEMBER_ID);
    }

	@Override
	public List<Map<String, Object>> getMyEvalList(Map<String, Object> parameter) {
		return sqlSessionTemplate.selectList("mypage.getMyEvalList", parameter);
	}
	
}