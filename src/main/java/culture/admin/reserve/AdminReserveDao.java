package culture.admin.reserve;

import java.util.List;

import culture.admin.music.AdminMusicModel;
import culture.admin.reserve.AdminReserveModel;


public interface AdminReserveDao {

	public List<AdminReserveModel> AdminReserveList();

	public AdminReserveModel AdminReserveDetail(int RESERVE_IDX);
	
	public int AdminReserveDelete(int RESERVE_IDX);

	List<AdminReserveModel> reserveSearch0(String search);
	
	List<AdminReserveModel> reserveSearch1(String search);
		  
	List<AdminReserveModel> reserveSearch2(String search);

	//결제 완료
	public int AdminReserveModify(AdminReserveModel reserve);

	public int AdminReserveModifyBack(AdminReserveModel reserve);
	
	public int AdminReserveModifyAll(String idxArr);
	
	public int AdminReserveModifyBackAll(String idxArr);
	
	public int AdminReserveDeleteAll(String idxArr);

	
	
	
	
	
	/*public Object insertGoods(AdminReserveModel AdminReserveModel);
	
	
	List<GoodsModel> goodsSearch0(String search);
	List<GoodsModel> goodsSearch1(String search);
	List<GoodsModel> goodsSearch2(String search);
	List<GoodsModel> goodsSearch3(String search);
	
	public int goodsDelete(int goods_num);
	
	public int goodsModify(GoodsModel GoodsModel);
	
	public GoodsModel goodsAdminView(int goods_num);
	
	public List<MemberModel> memberList();
	
	List<MemberModel> memberSearch0(String search);
	
	//ȸ������
	public int memberDelete(String id);

	public Object adminmemberModify(MemberModel member);
	
	//�ֹ�����Ʈ ���
	public List<OrderModel> orderAllList();
	
	//�ֹ��˻�
	public List<OrderModel> orderSearch0(String search);
	
	//������
	public List<OrderModel> orderSearch1(String search);
	
	//�ֹ�����
	public List<OrderModel> orderSearch2(String search);
	
	//�ֹ�����
	public Object orderModify(OrderModel OrderModel);
	*/
}
