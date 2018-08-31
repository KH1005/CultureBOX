package culture.member.reservation;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import culture.admin.culture.seatModel;
import culture.member.culture.CultureModel;
import culture.member.reservation.reserveModel;

@Service
public class reserveService implements reserveDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insertReserve(reserveModel rvModel) {
		sqlSessionTemplate.insert("reserve.insertReserve", rvModel);
	}
	
	@Override
	public List<seatModel> selectSeat1(seatModel stModel) {
		return sqlSessionTemplate.selectList("reserve.selectSeat1", stModel);
	}
	
	@Override
	public List<seatModel> selectSeat2(seatModel stModel) {
		return sqlSessionTemplate.selectList("reserve.selectSeat2", stModel);
	}	
	
	@Override
	public void selectCulture(int CULTURE_IDX) {
		sqlSessionTemplate.selectOne("selectCidx", CULTURE_IDX);
	}
	
	@Override
	public List<CultureModel> selectDate(CultureModel ctModel) {
		return sqlSessionTemplate.selectList("culture.selectDate", ctModel);
	}
	
	@Override
	public List<seatModel> availableSeat(seatModel stModel) {
		return sqlSessionTemplate.selectList("reserve.availableSeat", stModel);
	}
	
	@Override
	public seatModel seatName(seatModel stModel) {
		return sqlSessionTemplate.selectOne("admin.seatName", stModel);
	}
	
	@Override
	public void seatReserve(seatModel stModel) {
		sqlSessionTemplate.update("admin.seatReserve", stModel);
	}
}