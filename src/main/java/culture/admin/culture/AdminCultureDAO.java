package culture.admin.culture;

import java.util.List;

import culture.admin.member.AdminMemberModel;
import culture.member.culture.CultureCommentModel;

public interface AdminCultureDAO {

	public List<AdminCultureModel> adminCultureList();

	public AdminCultureModel AdminCultureDetail(int CULTURE_IDX);

	public List<CultureCommentModel> cultureCommentList(int COMMENT_CULTUREIDX_IDX);

	public Object deleteCultureComment(CultureCommentModel cultureCommentModel);

	public Object CultureJoin(AdminCultureModel cultureModel);

	public AdminCultureModel CultureModify(int idx);

	public int AdminUpdateCulture(AdminCultureModel culture);

	public int AdminCultureDelete(String CULTURE_IDX);

	public int AdminCommentDelete(String COMMENT_IDX);

	List<AdminCultureModel> cultureSearch0(String search);
	
	public void insertSeat(seatModel stModel);
	
	public AdminCultureModel getSeat(int CULTURE_IDX);
}
