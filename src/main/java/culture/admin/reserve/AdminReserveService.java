package culture.admin.reserve;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class AdminReserveService implements AdminReserveDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<AdminReserveModel> AdminReserveList() {
		return sqlSessionTemplate.selectList("reserve.reserveList"); // 네임 스페이스.해당쿼리문!
	}

	@Override
	public AdminReserveModel AdminReserveDetail(int RESERVE_IDX) {
		return sqlSessionTemplate.selectOne("reserve.reserveDetail",RESERVE_IDX);
	}

	@Override
	public int AdminReserveDelete(int RESERVE_IDX) {
		return sqlSessionTemplate.update("reserve.reserveDelete",RESERVE_IDX);
	}

	
	
	}
	
	
	
	
	
