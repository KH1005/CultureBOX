package culture.member.my;

import java.util.List;
import java.util.Map;

public interface MypageDao {
	
	public List<Map<String, Object>> reserveList(Map<String, Object> parameter);
	
	public void updateQRcode(Map<String, Object> parameter);

}
