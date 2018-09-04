package culture.member.culture;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;


import culture.member.culture.CultureCommentModel;

public interface CultureDAO {

	public List<CultureModel> cultureList(); //모든 공연 게시글 출력
	
	public CultureModel cultureDetail(int CULTURE_IDX); //글 1개 출력
	
	public List<CultureCommentModel> cultureCommentList(int COMMENT_CULTUREIDX_IDX); //댓글 리스트
	
	public Object writeCultureComment(CultureCommentModel cultureCommentModel); //댓글 작성
	
	public Object deleteCultureComment(CultureCommentModel cultureCommentModel); //댓글 삭제
	
	public void modifyCultureComment(CultureCommentModel cultureCommentModel); //댓글 수정
	
}