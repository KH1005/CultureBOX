package culture.member.reservation;

public interface reserveDAO {

	void insertReserve(reserveBean rvBean);
	void insertSeat(seatBean stBean);
	void updateReserveSeat(seatBean stBean);
	void updateReserve(reserveBean rvBean);
	void updateReservePay(reserveBean rvBean);
	void selectSeat(reserveBean rvBean);
}
