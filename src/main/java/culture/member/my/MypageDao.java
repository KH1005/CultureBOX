package culture.member.my;

import java.util.List;
import java.util.Map;

import culture.member.evaluation.MemberModel;

public interface MypageDao {
	
	public List<Map<String, Object>> reserveList(Map<String, Object> parameter);
	
	public void updateQRcode(Map<String, Object> parameter);
	
	public Object memberModify(MemberModel memberModel);
	
	public Object memberDelete(String MEMBER_ID);
	
	public MemberModel getMember(String MEMBER_ID);
	
	public List<Map<String, Object>> getMyEvalList(Map<String, Object> parameter);
	
	

}
