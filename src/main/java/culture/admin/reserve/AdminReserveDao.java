package culture.admin.reserve;

import java.util.List;

import culture.admin.reserve.AdminReserveModel;


public interface AdminReserveDao {
	//��ǰ���
	public List<AdminReserveModel> AdminReserveList();

	public AdminReserveModel AdminReserveDetail(int RESERVE_IDX);
	
	public int AdminReserveDelete(int RESERVE_IDX);

	
	/*//��ǰ���
	public Object insertGoods(AdminReserveModel AdminReserveModel);*/
	
	/*//�˻� (0=��ǰ�̸�, 1=��ǰ��ȣ 2=ī�װ�)
	List<GoodsModel> goodsSearch0(String search);
	List<GoodsModel> goodsSearch1(String search);
	List<GoodsModel> goodsSearch2(String search);
	List<GoodsModel> goodsSearch3(String search);
	
	//�ۻ���
	public int goodsDelete(int goods_num);
	
	//�ۼ���
	public int goodsModify(GoodsModel GoodsModel);
	
	//�� �ϳ� �ҷ����� -����
	public GoodsModel goodsAdminView(int goods_num);
	
	//ȸ�����
	public List<MemberModel> memberList();
	
	//ȸ���˻�
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
