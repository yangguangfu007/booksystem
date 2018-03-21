package action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.BookDao;
import dao.OrderDao;
import dao.UserDao;
import entity.Book;
import entity.Cart;
import entity.Order_Detail;
import entity.T_order;
import entity.User;

public class OrderAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private T_order order;
	private OrderDao od=new OrderDao();
	private Object[] OrderList;
	private Object[] list;
	private UserDao ud=new UserDao();
	private BookDao bd=new BookDao();
	private String msg;
	
	
	
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public BookDao getBd() {
		return bd;
	}

	public void setBd(BookDao bd) {
		this.bd = bd;
	}

	public UserDao getUd() {
		return ud;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	public Object[] getList() {
		return list;
	}

	public void setList(Object[] list) {
		this.list = list;
	}

	

	public Object[] getOrderList() {
		return OrderList;
	}

	public void setOrderList(Object[] orderList) {
		OrderList = orderList;
	}

	public OrderDao getOd() {
		return od;
	}

	public void setOd(OrderDao od) {
		this.od = od;
	}

	public T_order getOrder() {
		return order;
	}

	public void setOrder(T_order order) {
		this.order = order;
	}

	public void validateOrderSubmit() {
		if (order.getName() == null || "".equals(order.getName())) {
			addFieldError("order.name", "�ռ�����������Ϊ�գ�");
		} else if (order.getName().length() < 2) {
			addFieldError("order.name", "�����������2λ��");
		}
		if (order.getPhone() == null || "".equals(order.getPhone())) {
			addFieldError("order.phone", "�绰����Ϊ�գ�");
		} else if (order.getPhone().length() < 11
				|| order.getPhone().length() > 11) {
			addFieldError("order.phone", "�绰����Ϊ11λ������д��ȷ�ĺ��롣");
		}
		if (order.getAddress() == null || "".equals(order.getAddress())) {
			addFieldError("order.address", "��ַ����Ϊ�գ�");
		} else if (order.getAddress().length() < 3) {
			addFieldError("order.address", "��ַ�ڱ������3λ��");
		}

	}


	public String orderSubmit() {
		// �����÷�����session
		ActionContext ac = ActionContext.getContext();
		Map<String,Object> session = ac.getSession();
		// ��session��ȡ���û��͹��ﳵ
		User u = (User) session.get("user");
		Cart cart = (Cart) session.get("cart");
		if (cart==null) {
			msg="�����ظ��ύ����";
			return "fail";
		}
		Map<Integer,Book> map = cart.getMap();
		// �������ﳵ����ÿ����Ʒ�浽�����������ÿ���������浽��������ÿ�������б����û�������Ϊ���
		for (Book book : map.values()) {
			// ȡ����Ʒ
			Order_Detail detail = new Order_Detail(book.getBname(),
					book.getBprice(), book.getNum(), book.getBprice()
							* book.getNum());
			detail.setOrder(order);// �Ѷ�������������붩���������
			order.getDetails().add(detail);//�򶩵������һ����������
			bd.updateBook(book);//������Ʒ������
		}
		order.setUser(u);//���û����������붩������
		if (od.addOrder(order)) {
			session.remove("cart");// �Ƴ���������session��Ĺ��ﳵ
			return SUCCESS;
		}
		return "fail";
	}
	//�����û�����
	public String findOrder(){
		ActionContext ac=ActionContext.getContext();
		Map<String,Object> session=ac.getSession();
		User user=(User) session.get("user");
		user=ud.findOneUser(user);
		OrderList=user.getOrders().toArray();
		if (OrderList!=null&&OrderList.length>0) {
			return SUCCESS;
		}
		return "fail";
	}
	//�������ж���
	public String findOrder1(){
		List<T_order> arr=od.findAllOrder();
		OrderList=new Object[arr.size()];
		for (int i = 0; i < arr.size(); i++) {
			OrderList[i]=arr.get(i);
		}
		if (OrderList!=null&&OrderList.length>0) {
			return SUCCESS;
		}
		return "fail";
	}
	
	public String findOrderDetail(){
		order=od.findOneOrder(order.getOrderid());
		list=order.getDetails().toArray();
		return SUCCESS;
	}
}
