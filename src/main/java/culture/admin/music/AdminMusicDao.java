package culture.admin.music;

import java.util.List;



public interface AdminMusicDao {
	//리스트
	public List<AdminMusicModel> AdminMusicList();
	//상세보기
	public AdminMusicModel AdminMusicDetail(int MUSIC_INDEX);
	//삭제
	public int AdminMusicDelete(int MUSIC_INDEX);
	//글쓰기
	public Object AdminMusicinsert(AdminMusicModel adminMusicModel);
}
