package test;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.Book;
import entity.Order_Detail;
import entity.T_order;
import entity.User;
import util.HibernateUtil;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session session=HibernateUtil.getSession();
		Transaction ts=session.beginTransaction();
	/*	
		Order_Detail detail=new Order_Detail("图书2",20.22, 2,40.44);
		
		T_order order =new T_order("收件人2", "13792498137", "天幕城2");
		
		User user=new User("订单关联2", "123");
		
		detail.setOrder(order);
		order.getDetails().add(detail);
		order.setUser(user);
		user.getOrders().add(order);
		
		session.saveOrUpdate(user);
		session.saveOrUpdate(order);*/
		Book book=new Book();
		book.setBauthor("yang");
		book.setBbrief("hahha");
		book.setBdate(new Date());
		book.setBname("xinzeng");
		book.setBnum(200);
		book.setBprice(12.3);
		book.setNum(0);
		session.saveOrUpdate(book);
		ts.commit();
		HibernateUtil.closeSession();
	}

}
