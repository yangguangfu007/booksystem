package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.T_order;
import util.HibernateUtil;

public class OrderDao {
	public boolean addOrder(T_order order) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.saveOrUpdate(order);
			ts.commit();
			return true;
		} catch (HibernateException e) {
			ts.rollback();
			e.printStackTrace();
			return false;
		}
	}

	// Í¨¹ý¶©µ¥ºÅÉ¾³ý¶©µ¥
	public boolean deleteOrder(int orderid) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		T_order order = new T_order();
		order.setOrderid(orderid);
		try {
			session.delete(order);
			ts.commit();
			return true;
		} catch (HibernateException e) {
			ts.rollback();
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	public List<T_order> findAllOrder() {
		Session session = HibernateUtil.getSession();
		String hql = "from T_order";
		Query query = session.createQuery(hql);
		return query.list();
	}

	public T_order findOneOrder(int orderid) {
		Session session = HibernateUtil.getSession();
		T_order order = (T_order) session.get(T_order.class, orderid);
		return order;
	}
}
