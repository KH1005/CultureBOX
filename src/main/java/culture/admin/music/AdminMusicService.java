package culture.admin.music;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import culture.admin.reserve.AdminReserveModel;

@Service
public class AdminMusicService implements AdminMusicDao {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<AdminMusicModel> AdminMusicList() {
		return sqlSessionTemplate.selectList("music.musicList"); // 네임 스페이스.해당쿼리문!
	}

	@Override
	public AdminMusicModel AdminMusicDetail(int MUSIC_INDEX) {
		return sqlSessionTemplate.selectOne("music.musicDetail",MUSIC_INDEX);
	}

	@Override
	public int AdminMusicDelete(int MUSIC_INDEX) {
		return sqlSessionTemplate.update("music.musicDelete",MUSIC_INDEX);
	}

	@Override
	public Object AdminMusicinsert(AdminMusicModel adminMusicModel) {
		return sqlSessionTemplate.insert("music.musicInsert", adminMusicModel);

	}

	
	
	
	
	
	
}