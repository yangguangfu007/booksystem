package entity;

import java.util.HashSet;
import java.util.Set;

public class T_order {
	private Integer orderid;
	private String name;
	private String phone;
	private String address;
	private User user;
	private Set<Order_Detail> details=new HashSet<Order_Detail>();
	
	
	
	public T_order() {
		super();
	}
	
	
	public T_order(String name, String phone, String address) {
		super();
		this.name = name;
		this.phone = phone;
		this.address = address;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Order_Detail> getDetails() {
		return details;
	}
	public void setDetails(Set<Order_Detail> details) {
		this.details = details;
	}
	
	
	
}
