package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	// ����hibernate�������ļ�
	private static final Configuration config = new Configuration()
			.configure("hibernate-config.xml");
	// ���̹߳���session,��֤ÿһ��ֻ��һ��session
	private static final ThreadLocal<Session> tl = new ThreadLocal<Session>();
	// ����session����
	private static final SessionFactory factory = config.buildSessionFactory();

	public static Session getSession() {
		// ���߳��ж�ȡsession
		Session session = tl.get();
		if (session == null) {
			// ���sessionΪ�գ�����һ��session�������浽�߳���
			session = factory.openSession();
			tl.set(session);
		}
		return session;
	}

	public static void closeSession() {
		Session session = tl.get();
		// ����߳�
		tl.set(null);
		if (session != null && session.isOpen()) {
			session.close();
		}
	}
}
