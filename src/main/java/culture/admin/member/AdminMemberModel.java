package culture.admin.member;

public class AdminMemberModel {
	
	private String MEMBER_ID;
	private String MEMBER_PASSWORD;
	private String MEMBER_NAME;
	private String MEMBER_EMAIL;
	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String MEMBER_ID) {
		this.MEMBER_ID = MEMBER_ID;
	}
	public String getMEMBER_PASSWORD() {
		return MEMBER_PASSWORD;
	}
	public void setMEMBER_PASSWORD(String MEMBER_PASSWORD) {
		this.MEMBER_PASSWORD = MEMBER_PASSWORD;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String MEMBER_NAME) {
		this.MEMBER_NAME = MEMBER_NAME;
	}
	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}
	public void setMEMBER_EMAIL(String MEMBER_EMAIL) {
		this.MEMBER_EMAIL = MEMBER_EMAIL;
	}

}
