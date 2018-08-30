package culture.member.reservation;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import culture.admin.culture.seatModel;
import culture.member.reservation.reserveModel;

@Service
public class reserveService implements reserveDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insertReserve(reserveModel rvBean) {
		sqlSessionTemplate.insert("insertReserve", rvBean);
	}
	
	@Override
	public void updateReserve(reserveModel rvBean) {
		sqlSessionTemplate.update("updateReserve", rvBean);
	}
	
	@Override
	public void updateReservePay(reserveModel rvBean) {
		sqlSessionTemplate.update("payCheck", rvBean);
	}
	
	@Override
	public List<seatModel> selectSeat(int CULTURE_IDX) {
		return sqlSessionTemplate.selectOne("selectSeat", CULTURE_IDX);
	}	
	
	@Override
	public void selectCulture(int CULTURE_IDX) {
		sqlSessionTemplate.selectOne("selectCidx", CULTURE_IDX);
	}
}
