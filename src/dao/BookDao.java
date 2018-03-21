package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;
import entity.Book;

public class BookDao {

	public boolean addBook(Book book) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try {
			session.save(book);
			ts.commit();
			return true;
		} catch (HibernateException e) {
			ts.rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteBook(int pk) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		Book book = (Book) session.get(Book.class, pk);
		try {
			session.delete(book);
			ts.commit();
			return true;
		} catch (HibernateException e) {
			ts.rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateBook(Book book) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		Book b= (Book) session.get(Book.class,book.getBid());
		b.setBnum(b.getBnum() - book.getNum());
		book.setNum(0);
		try {
			session.saveOrUpdate(b);
			ts.commit();
			return true;
		} catch (HibernateException e) {
			ts.rollback();
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Book> findAllBook(int type) {
		List<Book> list = new ArrayList<Book>();
		Session session = HibernateUtil.getSession();
		Query query = session.createQuery("from Book where type=?");
		query.setInteger(0, type);
		list = query.list();
		return list;
	}

	public Book findOneBook(int pk) {
		Session session = HibernateUtil.getSession();
		Book book = (Book) session.get(Book.class, pk);
		return book;
	}

	public Long getMaxPage(int size) {
		Session session = HibernateUtil.getSession();
		Query query = session.createQuery("select count(*) from Book");
		Long total = (Long) query.uniqueResult();
		return total % size == 0 ? (total / size) : (total / size) + 1;
	}
	
	@SuppressWarnings("unchecked")
	public List<Book> findAllBookByFenYe(Long currPage,int size){
		Session session=HibernateUtil.getSession();
		Query query=session.createQuery("from Book");
		query.setFirstResult((int) ((currPage-1)*size));
		query.setMaxResults(size);
		return query.list();
	} 
}
