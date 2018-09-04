package culture.member.login;

import java.util.List;
import culture.member.evaluation.MemberModel;


public interface MemberDao {
	public MemberModel logIn(MemberModel member);
	
	
	
	public Object signUp(MemberModel member);
	
	public MemberModel findId(MemberModel member);
	
	public MemberModel findPw(MemberModel member);
	
	/*public Object memberModify(MemberModel member);*/
	
	public Object memberDelete(String Member_Id);
	
	public Object getMember(String Member_Id);
	
	public MemberModel evaluation(MemberModel member);
	
	public int idcheck(String MEMBER_ID);
	
	public int emailcheck(String MEMBER_ID);
	
	

		
}
