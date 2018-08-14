package culture.admin.culture;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class AdminCultureService implements AdminCultureDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
    
	//콘서트 리스트
	@Override
	public List<AdminCultureModel> AdmincultureList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.AdminCultureList");
	}
	
    //콘서트 상세보기
	@Override
	public AdminCultureModel AdminCultureDetail(int CULTURE_IDX) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("admin.AdminCultureDetail", CULTURE_IDX);
	}
	
	
	
	


}
