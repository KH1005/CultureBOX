package culture.member.reservation;

import java.util.*;

import org.springframework.stereotype.Repository;;

@Repository
public class reserveBean {

	private int RESERVE_IDX;
	private String RESERVE_DATE;
	private String RESERVE_CONFIRM;
	private String RESERVE_ID;
	private int RESERVE_CIDX;

	public int getRESERVE_IDX() {
		return RESERVE_IDX;
	}
	public void setRESERVE_IDX(int rESERVE_IDX) {
		RESERVE_IDX = rESERVE_IDX;
	}
	public String getRESERVE_DATE() {
		return RESERVE_DATE;
	}
	public void setRESERVE_DATE(String rESERVE_DATE) {
		RESERVE_DATE = rESERVE_DATE;
	}
	public String getRESERVE_CONFIRM() {
		return RESERVE_CONFIRM;
	}
	public void setRESERVE_CONFIRM(String rESERVE_CONFIRM) {
		RESERVE_CONFIRM = rESERVE_CONFIRM;
	}
	public String getRESERVE_ID() {
		return RESERVE_ID;
	}
	public void setRESERVE_ID(String rESERVE_ID) {
		RESERVE_ID = rESERVE_ID;
	}
	public int getRESERVE_CIDX() {
		return RESERVE_CIDX;
	}
	public void setRESERVE_CIDX(int rESERVE_CIDX) {
		RESERVE_CIDX = rESERVE_CIDX;
	}
		
}
