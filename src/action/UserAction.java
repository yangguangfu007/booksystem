package action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDao;
import entity.User;

public class UserAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userpass1;
	private User user;
	private String msg;
	private UserDao ud = new UserDao();
	private ActionContext ac = ActionContext.getContext();
	private Map<String,Object> session = ac.getSession();

	/**
	 * ע��������У
	 */
	public void validateRegister() {
		if (user.getUsername() == null || "".equals(user.getUsername())) {
			addFieldError("user.username", "�û�������Ϊ�գ�");
		} else if (user.getUsername().length() < 2) {
			addFieldError("user.username", "�û����������2λ��");
		}
		if (user.getUserpass() == null || "".equals(user.getUserpass())) {
			addFieldError("user.userpass", "���벻��Ϊ�գ�");
		} else if (user.getUserpass().length() < 3) {
			addFieldError("user.userpass", "������ڼ�,������д3λ!");
		}
		if (userpass1 == null || "".equals(userpass1)) {
			addFieldError("userpass1", "ȷ�����벻��Ϊ�գ�");
		} else if (!user.getUserpass().equals(userpass1)) {
			addFieldError("userpass1", "������ȷ�����벻һ��,����������.");
		}
	}

	/**
	 * �û�ע��
	 * 
	 * @return
	 */
	public String register() {
		//�����û�Ϊ�ͻ�
		user.setUserlimit(0);
		if (ud.addUser(user)) {
			msg = "��ϲ��,ע��ɹ�!";
			return SUCCESS;
		}
		msg = "���ź�,ע��ʧ����!������ע��.";
		return "fail";
	}

	/**
	 * �û���¼
	 * 
	 * @return
	 */
	public String login() {
		User u = ud.findOneUser(user);
		if (u != null) {
			session.put("user", u);
//			msg="ע��ɹ������¼��";
			return SUCCESS;
		} else {
			msg = "�û������벻ƥ�䣡";
			return "fail";
		}
	}
	/**
	 *���û�Ҫ�ύ����ʱ, ��֤�û��Ƿ��¼��
	 * @return
	 */
	public String Usercheck() {
		User u = (User) session.get("user");
		if (u == null) {
			return LOGIN;
		} else {
			return SUCCESS;
		}
	}
	/**
	 * �û���¼1,�ɹ���ת����д�����������
	 * 
	 * @return
	 */
	public String login1() {
		User u = ud.findOneUser(user);
		if (u != null) {
			session.put("user", u);
			return SUCCESS;
		} else {
			msg = "�û������벻ƥ�䣡";
			return LOGIN;
		}
	}

	/**
	 * �˳���¼
	 * 
	 * @return
	 */
	public String exitLogin() {
		//��session���Ƴ��û�
		session.remove("user");
		//��session���Ƴ����ﳵ
		session.remove("cart");
		return SUCCESS;
	}

	public String getUserpass1() {
		return userpass1;
	}

	public void setUserpass1(String userpass1) {
		this.userpass1 = userpass1;
	}

	public ActionContext getAc() {
		return ac;
	}

	public void setAc(ActionContext ac) {
		this.ac = ac;
	}

	public Map<String,Object> getSession() {
		return session;
	}

	public void setSession(Map<String,Object> session) {
		this.session = session;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public UserDao getUd() {
		return ud;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}

}
