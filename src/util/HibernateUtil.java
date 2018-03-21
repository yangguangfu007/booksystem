package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	// 加载hibernate总配置文件
	private static final Configuration config = new Configuration()
			.configure("hibernate-config.xml");
	// 用线程管理session,保证每一次只用一个session
	private static final ThreadLocal<Session> tl = new ThreadLocal<Session>();
	// 创建session工厂
	private static final SessionFactory factory = config.buildSessionFactory();

	public static Session getSession() {
		// 从线程中读取session
		Session session = tl.get();
		if (session == null) {
			// 如果session为空，创建一个session，并保存到线程中
			session = factory.openSession();
			tl.set(session);
		}
		return session;
	}

	public static void closeSession() {
		Session session = tl.get();
		// 清空线程
		tl.set(null);
		if (session != null && session.isOpen()) {
			session.close();
		}
	}
}
