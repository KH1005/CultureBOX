package culture.member.login;

public class MemberModel {
	private int STAR_COUNT;  //별의 갯수
	public int getSTAR_COUNT() {
		return STAR_COUNT;
	}
	public void setSTAR_COUNT(int sTAR_COUNT) {
		STAR_COUNT = sTAR_COUNT;
	}
	public int getMUSIC_INDEX() {
		return MUSIC_INDEX;
	}
	public void setMUSIC_INDEX(int mUSIC_INDEX) {
		MUSIC_INDEX = mUSIC_INDEX;
	}
	private int MUSIC_INDEX;  //평가한 앨범 
	

	
	private String MEMBER_NAME;
	private String MEMBER_ID;
	private String MEMBER_EMAIL;
	private String MEMBER_PASSWORD;
	private String MEMBER_PASSWORD2;
	public String getMEMBER_PASSWORD2() {
		return MEMBER_PASSWORD2;
	}
	public void setMEMBER_PASSWORD2(String mEMBER_PASSWORD2) {
		MEMBER_PASSWORD2 = mEMBER_PASSWORD2;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}
	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}
	public String getMEMBER_PASSWORD() {
		return MEMBER_PASSWORD;
	}
	public void setMEMBER_PASSWORD(String mEMBER_PASSWORD) {
		MEMBER_PASSWORD = mEMBER_PASSWORD;
	}
	
	


}
