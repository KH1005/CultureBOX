package culture.admin.music;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import culture.admin.reserve.AdminReserveModel;
import culture.admin.music.MusicCommentModel;

@Service
public class AdminMusicService implements AdminMusicDao {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override//리스트
	public List<AdminMusicModel> AdminMusicList() {
		return sqlSessionTemplate.selectList("music.musicList"); // 네임 스페이스.해당쿼리문!
	}

	@Override//상세보기
	public AdminMusicModel AdminMusicDetail(int MUSIC_INDEX) {
		return sqlSessionTemplate.selectOne("music.musicDetail",MUSIC_INDEX);
	}

	/*@Override//삭제
	public int AdminMusicDelete(int MUSIC_INDEX) {
		return sqlSessionTemplate.update("music.musicDelete",MUSIC_INDEX);
	}
*/
	@Override//글쓰기
	public Object AdminMusicinsert(AdminMusicModel adminMusicModel) {
		return sqlSessionTemplate.insert("music.musicInsert", adminMusicModel);

	}

	@Override//댓글 리스트
	public List<MusicCommentModel> MusicCommentList(int MCOMMENT_MUSICIDX) {
	
		return sqlSessionTemplate.selectList("music.selectMusicCommentList", MCOMMENT_MUSICIDX);
	
	
	}

	@Override//댓글 삭제
	public Object DeleteMusicComment(MusicCommentModel musicCommentModel) {
		return sqlSessionTemplate.delete("music.deleteMusicComment",musicCommentModel);
	}

	
	
	
	
	
	
	
	
}
