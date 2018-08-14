package culture.admin.member;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class AdminMemberService implements AdminMemberDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<AdminMemberModel> AdminmemberList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.AdminMemberList");// namespace,해당query
	}
	
	// 회원수정폼
	@Override
	public AdminMemberModel getMember(String MEMBER_ID) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("admin.getMember", MEMBER_ID);
	}
	
    //회원수정완료
	@Override
	public void AdminUpdateMember(AdminMemberModel member) {
		// TODO Auto-generated method stub
		 sqlSessionTemplate.update("admin.AdminUpdateMember", member);
	}

     //회원삭제
	@Override
	public int adminMemberDelete(String MEMBER_ID) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("admin.adminDeleteMember", MEMBER_ID);
	}

	@Override
	public int adminEvalDelete(String MEMBER_ID) {
		return sqlSessionTemplate.delete("admin.AdmindeleteMember", MEMBER_ID);
	}

	@Override
	public int adminReserveDelete(String RESERVE_ID) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("admin.adminDeleteMember", RESERVE_ID);
	}

	@Override
	public int adminCommentDelete(String COMMENT_WRITERID) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("admin.AdminReserveDelete", COMMENT_WRITERID);
	}

	@Override
	public List<AdminMemberModel> memberSearch0(String search) {
		// TODO Auto-generated method stub
		return  sqlSessionTemplate.selectList("admin.memberSearch0", "%"+search+"%");

	}



	
	

}
