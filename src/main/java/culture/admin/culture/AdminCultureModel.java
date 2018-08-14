package culture.admin.culture;

import java.util.Date;

public class AdminCultureModel {
	
	private int CULTURE_IDX;
	private String CULTURE_NAME;
	private String CULTURE_CATEGORY;
	private Date CULTURE_START;
	private Date CULTURE_END;
	private String CULTURE_ORGNAME;
	private String CULTURE_SAVNAME;
	private String CULTURE_LOCATION;
	private String CULTURE_CONTENT;
	private String CULTURE_CHECK;
	
	
	public String getCULTURE_CHECK() {
		return CULTURE_CHECK;
	}
	public void setCULTURE_CHECK(String CULTURE_CHECK) {
		this.CULTURE_CHECK = CULTURE_CHECK;
	}
	
	
	public int getCULTURE_IDX() {
		return CULTURE_IDX;
	}
	public void setCULTURE_IDX(int CULTURE_IDX) {
		this.CULTURE_IDX = CULTURE_IDX;
	}
	public String getCULTURE_NAME() {
		return CULTURE_NAME;
	}
	public void setCULTURE_NAME(String CULTURE_NAME) {
		this.CULTURE_NAME = CULTURE_NAME;
	}
	public String getCULTURE_CATEGORY() {
		return CULTURE_CATEGORY;
	}
	public void setCULTURE_CATEGORY(String CULTURE_CATEGORY) {
		this.CULTURE_CATEGORY = CULTURE_CATEGORY;
	}
	public Date getCULTURE_START() {
		return CULTURE_START;
	}
	public void setCULTURE_START(Date CULTURE_START) {
		this.CULTURE_START = CULTURE_START;
	}
	public Date getCULTURE_END() {
		return CULTURE_END;
	}
	public void setCULTURE_END(Date CULTURE_END) {
		this.CULTURE_END = CULTURE_END;
	}
	public String getCULTURE_ORGNAME() {
		return CULTURE_ORGNAME;
	}
	public void setCULTURE_ORGNAME(String CULTURE_ORGNAME) {
		this.CULTURE_ORGNAME = CULTURE_ORGNAME;
	}
	public String getCULTURE_SAVNAME() {
		return CULTURE_SAVNAME;
	}
	public void setCULTURE_SAVNAME(String CULTURE_SAVNAME) {
		this.CULTURE_SAVNAME = CULTURE_SAVNAME;
	}
	public String getCULTURE_LOCATION() {
		return CULTURE_LOCATION;
	}
	public void setCULTURE_LOCATION(String CULTURE_LOCATION) {
		this.CULTURE_LOCATION = CULTURE_LOCATION;
	}
	public String getCULTURE_CONTENT() {
		return CULTURE_CONTENT;
	}
	public void setCULTURE_CONTENT(String CULTURE_CONTENT) {
		this.CULTURE_CONTENT = CULTURE_CONTENT;
	}
	
	

}
