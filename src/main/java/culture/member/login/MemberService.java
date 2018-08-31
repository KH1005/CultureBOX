package culture.member.login;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import culture.member.evaluation.MemberModel;

@Service
public class MemberService implements MemberDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	// 로그인 
	@Override
	public MemberModel logIn(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.login", member);
	}

	
	
	// 회원정보 입력
	@Override
	public Object signUp(MemberModel member) {
		return sqlSessionTemplate.insert("member.signUp", member);
	}

	// id 찾기
	@Override
	public MemberModel findId(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.findId", member);
	}

	// 회원수정
	/*@Override
	public Object memberModify(MemberModel member) {
		return sqlSessionTemplate.update("member.updateMember", member);
	}*/
	

	
		
	// 회원탈퇴
	@Override
	public Object memberDelete(String Member_Id) {
		return sqlSessionTemplate.delete("member.deleteMember", Member_Id);
	}
	
	@Override
	public Object getMember(String MEMBER_ID) {
		return sqlSessionTemplate.selectOne("member.getMember", MEMBER_ID);
	}
	@Override
	public MemberModel evaluation(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.getEvaluation", member);
		
	}
	
	/*메일 중복체크*/
	@Override
	public int emailcheck(String MEMBER_EMAIL) {
		return sqlSessionTemplate.selectOne("member.checkemail", MEMBER_EMAIL);
	}

	/*public static int checkSignup(String Member_Id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.getId", Member_Id);
	}*/
	
	public int idcheck(String MEMBER_ID) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.checkId", MEMBER_ID);
	}



	@Override
	public MemberModel findPw(MemberModel member) {
		// TODO Auto-generated method stub
		return null;
	}
	

	
}
