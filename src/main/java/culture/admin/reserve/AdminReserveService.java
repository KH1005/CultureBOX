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
		return sqlSessionTemplate.selectList("adminreserve.reserveList"); // 네임 스페이스.해당쿼리문!
	}

	@Override
	public AdminReserveModel AdminReserveDetail(int RESERVE_IDX) {
		return sqlSessionTemplate.selectOne("adminreserve.reserveDetail",RESERVE_IDX);
	}

	@Override
	public int AdminReserveDelete(int RESERVE_IDX) {
		return sqlSessionTemplate.update("adminreserve.reserveDelete",RESERVE_IDX);
	}
     //검색
	@Override
	   public List<AdminReserveModel> reserveSearch0(String search) {
	      return  sqlSessionTemplate.selectList("adminreserve.ReserveSearch0", "%"+search+"%");
	   }

	@Override
	public List<AdminReserveModel> reserveSearch1(String search) {
	      return  sqlSessionTemplate.selectList("adminreserve.ReserveSearch1", "%"+search+"%");
	}
	
	@Override
	public List<AdminReserveModel> reserveSearch2(String search) {
	      return  sqlSessionTemplate.selectList("adminreserve.ReserveSearch2", "%"+search+"%");
	}
	//결제확인
	@Override
	public int AdminReserveModify(AdminReserveModel reserve) {
	   return sqlSessionTemplate.update("adminreserve.reserveModify0",reserve); 
	}

	@Override
	public int AdminReserveModifyBack(AdminReserveModel reserve) {
		   return sqlSessionTemplate.update("adminreserve.reserveModify1",reserve); 
	}

	@Override
	public int AdminReserveModifyAll(String idxArr) {
		   return sqlSessionTemplate.update("adminreserve.reserveModify0", idxArr); 
	}

	@Override
	public int AdminReserveModifyBackAll(String idxArr) {
	 return sqlSessionTemplate.update("adminreserve.reserveModify1", idxArr); 
	}

	@Override
	public int AdminReserveDeleteAll(String idxArr) {
		return sqlSessionTemplate.update("adminreserve.reserveDelete",idxArr);
	} 

	
	
	
	
	
	}
	
	
	
	
	
