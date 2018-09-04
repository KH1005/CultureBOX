package culture.member.reservation;

import java.util.List;

import culture.admin.culture.seatModel;
import culture.member.culture.CultureModel;

public interface reserveDAO {

	void insertReserve(reserveModel rvModel);
	List<seatModel> selectSeat1(seatModel stModel);
	List<seatModel> selectSeat2(seatModel stModel);
	void selectCulture(int CULTURE_IDX);
	List<CultureModel> selectDate(CultureModel ctModel);
	List<seatModel> availableSeat(seatModel stModel);
	seatModel seatName(seatModel stModel);
	void seatReserve(seatModel stModel);
} 

