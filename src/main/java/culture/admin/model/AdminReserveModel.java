package culture.admin.model;

import java.util.Date;

public class AdminReserveModel {


	public int getReserve_idx() {
		return reserve_idx;
	}
	public void setReserve_idx(int reserve_idx) {
		this.reserve_idx = reserve_idx;
	}
	public Date getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getReserve_confirm() {
		return reserve_confirm;
	}
	public void setReserve_confirm(String reserve_confirm) {
		this.reserve_confirm = reserve_confirm;
	}
	public String getReserve_id() {
		return reserve_id;
	}
	public void setReserve_id(String reserve_id) {
		this.reserve_id = reserve_id;
	}
	public int getReserve_sidx() {
		return reserve_sidx;
	}
	public void setReserve_sidx(int reserve_sidx) {
		this.reserve_sidx = reserve_sidx;
	}
	public int getReserve_cidx() {
		return reserve_cidx;
	}
	public void setReserve_cidx(int reserve_cidx) {
		this.reserve_cidx = reserve_cidx;
	}
	
	private int reserve_idx;
	private Date reserve_date;  //주문날짜
	private String reserve_confirm; // 송장 번호 기본값-준비중
	private String reserve_id; //상품 이름
	private int reserve_sidx; 
	private int reserve_cidx;
	
}
