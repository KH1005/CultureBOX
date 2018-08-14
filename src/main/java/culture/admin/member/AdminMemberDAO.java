package culture.admin.member;

import java.util.List;

public interface AdminMemberDAO {

	// 회원목록
	public List<AdminMemberModel> AdminmemberList();

	// 아이디 가져오기(수정폼)
	public AdminMemberModel getMember(String id);

	// 회원수정
	public void AdminUpdateMember(AdminMemberModel member);

	// 회원삭제
	public int adminMemberDelete(String MEMBER_ID);

	public int adminEvalDelete(String MEMBER_ID);

	public int adminReserveDelete(String RESERVE_ID);

	public int adminCommentDelete(String COMMENT_WRITERID);

	// 회원검색
	List<AdminMemberModel> memberSearch0(String search);

	
}



