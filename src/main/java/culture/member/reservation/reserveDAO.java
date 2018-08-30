package culture.member.reservation;

import java.util.List;

import culture.admin.culture.seatModel;

public interface reserveDAO {

	void insertReserve(reserveModel rvBean);
	void updateReserve(reserveModel rvBean);
	void updateReservePay(reserveModel rvBean);
	List<seatModel> selectSeat(int CULTURE_IDX);
	void selectCulture(int CULTURE_IDX);
}
