package culture.admin.culture;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import culture.member.culture.CultureCommentModel;

@Service
public class AdminCultureService implements AdminCultureDAO {
   
   @Resource(name = "sqlSessionTemplate")
   private SqlSessionTemplate sqlSessionTemplate;
    
   //콘서트 리스트
   @Override
   public List<AdminCultureModel> adminCultureList() {
      // TODO Auto-generated method stub
      return sqlSessionTemplate.selectList("admin.AdminCultureList");
   }
   
    //콘서트 상세보기
   @Override
   public AdminCultureModel AdminCultureDetail(int CULTURE_IDX) {
      // TODO Auto-generated method stub
      return sqlSessionTemplate.selectOne("admin.AdminCultureDetail", CULTURE_IDX);
   }

   @Override
   public List<CultureCommentModel> cultureCommentList(int COMMENT_CULTUREIDX) { //댓글 리스트 가져오기
      // TODO Auto-generated method stub
      return sqlSessionTemplate.selectList("culture.selectCultureCommentList",COMMENT_CULTUREIDX);
   }

   @Override
   public Object deleteCultureComment(CultureCommentModel cultureCommentModel) {
      // TODO Auto-generated method stub
      return sqlSessionTemplate.delete("culture.deleteCultureComment",cultureCommentModel);
   }

   @Override
   public Object CultureJoin(AdminCultureModel cultureModel) {
      // TODO Auto-generated method stub
      return sqlSessionTemplate.insert("admin.CultureJoin", cultureModel);
   }

   @Override
   public AdminCultureModel CultureModify(int CULTURE_IDX) {
      // TODO Auto-generated method stub
      return sqlSessionTemplate.selectOne("admin.CultureModify", CULTURE_IDX);
   }

   @Override
   public int AdminUpdateCulture(AdminCultureModel culture) {
      // TODO Auto-generated method stub
      return sqlSessionTemplate.update("admin.AdminCultureModify",culture); 
   }

   @Override
   public int AdminCultureDelete(String CULTURE_IDX) {
      // TODO Auto-generated method stub
      return sqlSessionTemplate.delete("admin.CultureDelete", CULTURE_IDX);
   }

   @Override
   public int AdminCommentDelete(String COMMENT_IDX) {
      // TODO Auto-generated method stub
      return sqlSessionTemplate.delete("admin.CultureCommentDelete", COMMENT_IDX);

   }

   @Override
   public List<AdminCultureModel> cultureSearch0(String search) {
      // TODO Auto-generated method stub
      return  sqlSessionTemplate.selectList("admin.cultureSearch0", "%"+search+"%");
   }
   
   @Override
   public void insertSeat(seatModel stModel) {
      sqlSessionTemplate.insert("insertSeat", stModel);
   }
   
   @Override
   public AdminCultureModel getSeat(int CULTURE_IDX) {
      return sqlSessionTemplate.selectOne("admin.getSeat", CULTURE_IDX);
   }

   @Override
   public int CultureJoinSeat() {
	return sqlSessionTemplate.selectOne("admin.CultureJoinSeat");
   }

   
}

