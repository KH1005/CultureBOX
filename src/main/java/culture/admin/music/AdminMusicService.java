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

	@Override//由ъ뒪??
	public List<AdminMusicModel> AdminMusicList() {
		return sqlSessionTemplate.selectList("music.musicList"); // ?ㅼ엫 ?ㅽ럹?댁뒪.?대떦荑쇰━臾?
	}

	@Override//?곸꽭蹂닿린
	public AdminMusicModel AdminMusicDetail(int MUSIC_INDEX) {
		return sqlSessionTemplate.selectOne("music.musicDetail",MUSIC_INDEX);
	}

	
	//삭제
	@Override
	public int AdminMusicDelete(String MUSIC_INDEX) {
		return sqlSessionTemplate.delete("music.musicDelete",MUSIC_INDEX);
	}

	@Override
	public int AdminMusicCommentDelete(String MCOMMENT_IDX) {
		return sqlSessionTemplate.delete("music.musicDeleteComment",MCOMMENT_IDX);
	}
	
	@Override
	public int AdminEvalDelete(String MUSIC_INDEX) {
		return sqlSessionTemplate.delete("music.evalDelete",MUSIC_INDEX);
	}

	@Override//글쓰기
	public Object AdminMusicinsert(AdminMusicModel adminMusicModel) {
		return sqlSessionTemplate.insert("music.musicInsert", adminMusicModel);
	}

	@Override//?볤? 由ъ뒪??
	public List<MusicCommentModel> MusicCommentList(int MCOMMENT_MUSICIDX) {
	
		return sqlSessionTemplate.selectList("music.selectMusicCommentList", MCOMMENT_MUSICIDX);
	}
	
	
	@Override//?뚯븙 由ъ뒪??寃??
	public List<AdminMusicModel> musicSearch0(String search) {
		return  sqlSessionTemplate.selectList("music.musicSearch0", "%"+search+"%");
	}

	@Override
	public List<AdminMusicModel> musicSearch1(String search) {
		return  sqlSessionTemplate.selectList("music.musicSearch1", "%"+search+"%");
	}

	@Override
	public List<AdminMusicModel> musicSearch2(String search) {
		return  sqlSessionTemplate.selectList("music.musicSearch2", "%"+search+"%");
	}

	@Override//?볤? ??젣
	public Object DeleteMusicComment(MusicCommentModel musicCommentModel) {
		return sqlSessionTemplate.delete("music.deleteMusicComment",musicCommentModel);
	}

			
	@Override//?섏젙???꾩슦湲?
	public AdminMusicModel AdminMusicModifyForm(int MUSIC_INDEX) {
		return sqlSessionTemplate.selectOne("music.musicModifyForm", MUSIC_INDEX);
	}

	@Override
	public int AdminMusicModify(AdminMusicModel music) {
	      return sqlSessionTemplate.update("music.musicModify",music); 
	}

	
	
	
	
	
	
}
