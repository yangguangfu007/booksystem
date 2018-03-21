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
			addFieldError("order.name", "收件人姓名不能为空！");
		} else if (order.getName().length() < 2) {
			addFieldError("order.name", "姓名必须大于2位！");
		}
		if (order.getPhone() == null || "".equals(order.getPhone())) {
			addFieldError("order.phone", "电话不能为空！");
		} else if (order.getPhone().length() < 11
				|| order.getPhone().length() > 11) {
			addFieldError("order.phone", "电话号码为11位！请填写正确的号码。");
		}
		if (order.getAddress() == null || "".equals(order.getAddress())) {
			addFieldError("order.address", "地址不能为空！");
		} else if (order.getAddress().length() < 3) {
			addFieldError("order.address", "地址在必须大于3位！");
		}

	}


	public String orderSubmit() {
		// 解耦获得服务器session
		ActionContext ac = ActionContext.getContext();
		Map<String,Object> session = ac.getSession();
		// 从session中取出用户和购物车
		User u = (User) session.get("user");
		Cart cart = (Cart) session.get("cart");
		if (cart==null) {
			msg="不能重复提交订单";
			return "fail";
		}
		Map<Integer,Book> map = cart.getMap();
		// 遍历购物车并将每种商品存到订单详情表，将每个订单保存到订单表，将每个订单中保存用户主键作为外键
		for (Book book : map.values()) {
			// 取出商品
			Order_Detail detail = new Order_Detail(book.getBname(),
					book.getBprice(), book.getNum(), book.getBprice()
							* book.getNum());
			detail.setOrder(order);// 把订单表的主键放入订单详情表中
			order.getDetails().add(detail);//向订单中添加一个订单详情
			bd.updateBook(book);//更新商品的数量
		}
		order.setUser(u);//把用户的主键放入订单表中
		if (od.addOrder(order)) {
			session.remove("cart");// 移除服务器中session存的购物车
			return SUCCESS;
		}
		return "fail";
	}
	//查找用户订单
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
	//查找所有订单
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
