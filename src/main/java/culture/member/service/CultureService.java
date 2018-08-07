package culture.member.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import culture.member.dao.CultureDAO;
import culture.member.model.CultureModel;

@Service
public class CultureService implements CultureDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<CultureModel> cultureList(){
		return sqlSessionTemplate.selectList("culture.selectCulture_ALL");
	}
	@Override
	public CultureModel cultureDetail(int culture_idx) {
		
		return sqlSessionTemplate.selectOne("culture.selectCulture_ONE", culture_idx);
	}
	
	
	

}
