package culture.member.reservation;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import culture.member.reservation.reserveBean;
import culture.member.reservation.seatBean;

@Service
public class reserveService implements reserveDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insertSeat(seatBean stBean) {
		sqlSessionTemplate.insert("insertSeat", stBean);
	}
	
	@Override
	public void insertReserve(reserveBean rvBean) {
		sqlSessionTemplate.insert("insertReserve", rvBean);
	}
	
	@Override
	public void updateReserve(reserveBean rvBean) {
		sqlSessionTemplate.update("updateReserve", rvBean);
	}
	
	@Override
	public void updateReservePay(reserveBean rvBean) {
		sqlSessionTemplate.update("payCheck", rvBean);
	}
	
	@Override
	public void updateReserveSeat(seatBean stBean) {
		sqlSessionTemplate.update("reservedSeat", stBean);
	}
	
	@Override
	public void selectSeat(reserveBean rvBean) {
		sqlSessionTemplate.selectOne("selectSeat", rvBean);
	}	
}
