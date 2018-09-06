package culture.admin.music;

import java.util.List;

import culture.admin.member.AdminMemberModel;
import culture.member.culture.CultureCommentModel;



public interface AdminMusicDao {
	//리스트
	public List<AdminMusicModel> AdminMusicList();
	//상세보기
	public AdminMusicModel AdminMusicDetail(int MUSIC_INDEX);
	//삭제
	public int AdminMusicDelete(String MUSIC_INDEX);
	
	public int AdminMusicCommentDelete(String MCOMMENT_IDX);

	public int AdminEvalDelete(String MUSIC_INDEX);
	//글쓰기
	public Object AdminMusicinsert(AdminMusicModel adminMusicModel);
	
	public AdminMusicModel selectMusic(AdminMusicModel adminMusicModel);
	//댓글 리스트
	public List<MusicCommentModel> MusicCommentList(int MCOMMENT_MUSICIDX_IDX); 

	//댓글 삭제
	public Object DeleteMusicComment(MusicCommentModel musicCommentModel);
	
	//수정폼 띄우기
	public AdminMusicModel AdminMusicModifyForm(int MUSIC_INDEX);

	//수정 완료
	public int AdminMusicModify(AdminMusicModel music);
	
	//음악 리스트 검색
	List<AdminMusicModel> musicSearch0(String search);
	
	List<AdminMusicModel> musicSearch1(String search);

	List<AdminMusicModel> musicSearch2(String search);

	
	
	
}
