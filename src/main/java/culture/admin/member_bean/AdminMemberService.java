package culture.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;


	@Service
	public class AdminMemberService implements AdminMemberDAO{
		
	}
	   @Resource(name="sqlSessionTemplate")
	   private SqlSessionTemplate sqlSessionTemplate;
	
	//ȸ����� ���
		@Override
		public List<MemberModel> memberList() {
			return sqlSessionTemplate.selectMemberList("member.memberList");
		}
		
		
		


}
