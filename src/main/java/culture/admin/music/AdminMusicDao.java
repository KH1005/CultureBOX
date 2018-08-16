package culture.admin.music;

import java.util.List;

import culture.member.culture.CultureCommentModel;



public interface AdminMusicDao {
	//리스트
	public List<AdminMusicModel> AdminMusicList();
	//상세보기
	public AdminMusicModel AdminMusicDetail(int MUSIC_INDEX);
	//삭제
/*	public int AdminMusicDelete(int MUSIC_INDEX);
*/	//글쓰기
	public Object AdminMusicinsert(AdminMusicModel adminMusicModel);
	
	//댓글 리스트
	public List<MusicCommentModel> MusicCommentList(int MCOMMENT_MUSICIDX_IDX); 

	//댓글 삭제
	public Object DeleteMusicComment(MusicCommentModel musicCommentModel);
	
}
