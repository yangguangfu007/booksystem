package dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;
import entity.User;

public class UserDao {

	public boolean addUser(User u) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.save(u);
			ts.commit();
			return true;
		} catch (HibernateException e) {
			ts.rollback();
			e.printStackTrace();
			return false;
		}
	}

	public User findOneUser(User u) {
		Session session = HibernateUtil.getSession();
		String hql = "from User where username=:name and userpass=:pass";
		Query query = session.createQuery(hql);
		query.setString("name", u.getUsername());
		query.setString("pass", u.getUserpass());
		User user = (User) query.uniqueResult();
		return user;
	}
}
