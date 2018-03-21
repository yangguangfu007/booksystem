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
	 * 注册数据验校
	 */
	public void validateRegister() {
		if (user.getUsername() == null || "".equals(user.getUsername())) {
			addFieldError("user.username", "用户名不能为空！");
		} else if (user.getUsername().length() < 2) {
			addFieldError("user.username", "用户名必须大于2位！");
		}
		if (user.getUserpass() == null || "".equals(user.getUserpass())) {
			addFieldError("user.userpass", "密码不能为空！");
		} else if (user.getUserpass().length() < 3) {
			addFieldError("user.userpass", "密码过于简单,至少填写3位!");
		}
		if (userpass1 == null || "".equals(userpass1)) {
			addFieldError("userpass1", "确认密码不能为空！");
		} else if (!user.getUserpass().equals(userpass1)) {
			addFieldError("userpass1", "密码与确认密码不一致,请重新输入.");
		}
	}

	/**
	 * 用户注册
	 * 
	 * @return
	 */
	public String register() {
		//设置用户为客户
		user.setUserlimit(0);
		if (ud.addUser(user)) {
			msg = "恭喜您,注册成功!";
			return SUCCESS;
		}
		msg = "很遗憾,注册失败了!请重新注册.";
		return "fail";
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	public String login() {
		User u = ud.findOneUser(user);
		if (u != null) {
			session.put("user", u);
//			msg="注册成功，请登录！";
			return SUCCESS;
		} else {
			msg = "用户名密码不匹配！";
			return "fail";
		}
	}
	/**
	 *当用户要提交订单时, 验证用户是否登录，
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
	 * 用户登录1,成功跳转到填写订单详情界面
	 * 
	 * @return
	 */
	public String login1() {
		User u = ud.findOneUser(user);
		if (u != null) {
			session.put("user", u);
			return SUCCESS;
		} else {
			msg = "用户名密码不匹配！";
			return LOGIN;
		}
	}

	/**
	 * 退出登录
	 * 
	 * @return
	 */
	public String exitLogin() {
		//从session中移除用户
		session.remove("user");
		//从session中移除购物车
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
