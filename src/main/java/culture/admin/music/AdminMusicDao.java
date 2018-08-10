package culture.admin.music;

import java.util.List;


public interface AdminMusicDao {

	public List<AdminMusicModel> AdminMusicList();
	
	public AdminMusicModel AdminMusicDetail(int MUSIC_INDEX);


}
