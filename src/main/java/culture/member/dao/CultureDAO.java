package culture.member.dao;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

import culture.member.model.CultureModel;

public interface CultureDAO {

	public List<CultureModel> cultureList(); //모든 공연 게시글 출력
	
	public CultureModel cultureDetail(int culture_idx); //글 1개 출력

}