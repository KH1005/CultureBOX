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
	private SqlSessionTemplate sqlSessionTemplate1;
	
	@Override
	public List<Map<String, Object>> reserveList(Map<String, Object> parameter) {
		System.out.println(parameter.get("RESERVE_ID"));
		return sqlSessionTemplate1.selectList("mypage.reserveList",parameter);
	}

	@Override
	public void updateQRcode(Map<String, Object> parameter) {
		sqlSessionTemplate1.update("mypage.updateQRcode",parameter);
		
	}
	
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public MemberModel getMember(String MEMBER_ID) {
		return sqlSessionTemplate1.selectOne("member.getMember", MEMBER_ID);
	}

	@Override
	public Object memberModify(MemberModel memberModel) {
		return sqlSessionTemplate1.update("member.updateMember", memberModel);
	}

	@Override
	public Object memberDelete(String MEMBER_ID) {
		return sqlSessionTemplate1.delete("member.deleteMember", MEMBER_ID);
    }


}
