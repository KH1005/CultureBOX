package culture.member.my;

import java.util.List;
import java.util.Map;

import culture.member.evaluation.MemberModel;
import culture.member.reservation.reserveModel;

public interface MypageDao {
	
	public List<Map<String, Object>> reserveList(Map<String, Object> parameter);
	
	public List<Map<String, Object>> memberOrderList(Map<String, Object> parameter);
	
	public void updateQRcode(Map<String, Object> parameter);
	
	public Object memberModify(MemberModel member);
	
	public Object memberDelete(String MEMBER_ID);
	
	public Object memberDelete2(String MEMBER_ID);
	
	public Object memberDelete3(String MEMBER_ID);
	
	public MemberModel getMember(String MEMBER_ID);
	
	public List<Map<String, Object>> getMyEvalList(Map<String, Object> parameter);
	

	public int reserveCancel(int RESERVE_IDX);

	public Map<String, Object> getMyEvalCount(Map<String, Object> parameter);
	
	public Map<String, Object> getMyEvalMean(Map<String, Object> parameter);

	public List<Map<String, Object>> getStar(Map<String, Object> parameter);
}
