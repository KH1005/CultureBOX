package culture.member.my;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

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
	
	
	

}
