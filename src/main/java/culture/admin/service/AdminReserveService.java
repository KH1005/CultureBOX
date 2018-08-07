package culture.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;


import culture.admin.dao.AdminReserveDao;
import culture.admin.model.AdminReserveModel;

@Service
public class AdminReserveService implements AdminReserveDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<AdminReserveModel> AdminReserveList() {
		return sqlSessionTemplate.selectList("reserve.reserveList");
	}
	
	
}
