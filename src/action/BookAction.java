 package action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.BookDao;
import entity.Book;
import entity.Cart;

public class BookAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Book> list=new ArrayList<Book>();
	private List<Book> updatelist;
	private BookDao bd=new BookDao();
	private Book book;
	private Cart cart;
	private double totalMoney=0;
	private File uploadimg;
	private String uploadimgFileName;
	private String uploadimgContentType;
	private String dir;//保存上传文件的文件夹
	private Integer type;//查询类型
	
	private Long maxPage;
	private Integer size;//每页显示的最大条数
	private Long currPage;//当前页
	private InputStream inputStream;//用于ajax请求，修改商品数量
	/***
	 * 条件查找
	 * @return
	 */
	public String findAllBook(){
		list=bd.findAllBook(type);
		if (list!=null||list.size()>=0) {
			return SUCCESS;
		}else{
			return "fail";
		}
	}
	
	public String showAllBookByFenYe(){
		maxPage=bd.getMaxPage(size);
		if (currPage==null||currPage<1) {
			currPage=1L;
		}else if (currPage>maxPage) {
			currPage=maxPage;
		}
		list=bd.findAllBookByFenYe(currPage, size);
		if (list!=null||list.size()>=0) {
			return SUCCESS;
		}else{
			return "fail";
		}
	}
	
	public String findOneBook(){
		book=bd.findOneBook(book.getBid());
		return SUCCESS;
	}
	
	public void validateAddBook() {
		if (book.getBname()==null||book.getBname().equals("")) {
			addFieldError("book.bname", "书名不能为空！");
		}
		if (book.getBnum()==null||book.getBnum().equals("")) {
			addFieldError("book.bnum", "数量不能为空！");
		}
		if (book.getBprice()==null||book.getBprice().equals("")) {
			addFieldError("book.bprice", "价格不能为空！");
		}
		if (uploadimg==null) {
			addFieldError("uploadimg","请添加图片！");
		}
	}
	public String addBook(){
		//1.上传图片
		String savePath=ServletActionContext.getServletContext()
				.getRealPath(dir)+"/"+uploadimgFileName;
		System.out.println(savePath);
		try {
			FileInputStream fis=new FileInputStream(uploadimg);
			FileOutputStream fos=new FileOutputStream(savePath);
			byte[] b= new byte[1024];
			int lenth=fis.read(b);
			while(lenth>0) {
				fos.write(b, 0, lenth);
				lenth=fis.read(b);
				fos.flush();
			}
			fis.close();
			fos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
 		//2.保存图片url到数据库
		book.setUrl(dir.substring(1)+"/"+uploadimgFileName);
		bd.addBook(book);
		return SUCCESS;
	}
	
	public String addToCart(){
		ActionContext ac=ActionContext .getContext();
		Map<String,Object> session =ac.getSession();
		cart=(Cart) session.get("cart");
		if (cart==null) {
			cart=new  Cart();
		}
		Map<Integer,Book> map=cart.getMap();
		if (map.containsKey(book.getBid())) {
			book= (Book) map.get(book.getBid());
			//数量加1
			book.addNum();
			map.put(book.getBid(), book);
		}else{
			book=bd.findOneBook(book.getBid());
			book.setNum(1);
			map.put(book.getBid(), book);
		}
		cart.setMap(map);
		session.put("cart", cart);
		return SUCCESS;
	}
	
	public String showCart(){
		ActionContext ac=ActionContext .getContext();
		Map<String,Object> session =ac.getSession();
		cart=(Cart) session.get("cart");
		if (cart==null) {
			return "fail";
		}
		Map<Integer,Book> map=cart.getMap();
		Set<Integer> set= map.keySet();
		for (Object bid : set) {
			book=(Book) map.get(bid);
			list.add(book);
			totalMoney+=book.getBprice()*book.getNum();
		}
		return SUCCESS;
	}
	
	public String upateCart(){
		ActionContext ac=ActionContext .getContext();
		Map<String,Object> session =ac.getSession();
		cart=(Cart) session.get("cart");
		if (book.getNum()!=null) {
			//修改购物车中的商品数量
			Book b=cart.getMap().get(book.getBid());
			b.setNum(book.getNum());
			cart.getMap().put(b.getBid(), b);
			session.put("cart", cart);
		}else{
			//从购物车总删除该商品
			cart.getMap().remove(book.getBid());
			session.put("cart", cart);
		}
		try {
			inputStream=new ByteArrayInputStream("ok".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public List<Book> getList() {
		return list;
	}
	
	
	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public void setList(List<Book> list) {
		this.list = list;
	}



	public BookDao getBd() {
		return bd;
	}



	public void setBd(BookDao bd) {
		this.bd = bd;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public File getUploadimg() {
		return uploadimg;
	}

	public void setUploadimg(File uploadimg) {
		this.uploadimg = uploadimg;
	}

	public String getUploadimgFileName() {
		return uploadimgFileName;
	}

	public void setUploadimgFileName(String uploadimgFileName) {
		this.uploadimgFileName = uploadimgFileName;
	}

	public String getUploadimgContentType() {
		return uploadimgContentType;
	}

	public void setUploadimgContentType(String uploadimgContentType) {
		this.uploadimgContentType = uploadimgContentType;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public Long getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(Long maxPage) {
		this.maxPage = maxPage;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Long getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Long currPage) {
		this.currPage = currPage;
	}

	public List<Book> getUpdatelist() {
		return updatelist;
	}

	public void setUpdatelist(List<Book> updatelist) {
		this.updatelist = updatelist;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	

}
