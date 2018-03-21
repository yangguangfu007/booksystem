package entity;

import java.util.HashSet;
import java.util.Set;

public class User {
	private String username;
	private String userpass;
	private Integer userid;
	private Integer userlimit;
	private Cart cart;
	private Set<T_order> orders = new HashSet<T_order>();
	
	public User() {
		super();
	}
	

	public User(String username, String userpass) {
		super();
		this.username = username;
		this.userpass = userpass;
	}



	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getUserlimit() {
		return userlimit;
	}

	public void setUserlimit(Integer userlimit) {
		this.userlimit = userlimit;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Set<T_order> getOrders() {
		return orders;
	}

	public void setOrders(Set<T_order> orders) {
		this.orders = orders;
	}

}
