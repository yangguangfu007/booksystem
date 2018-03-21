package entity;

import java.util.Date;

public class Book {
	private Integer bid;
	private String bname;
	private String bauthor;//作者
	private String bbrief;//简介
	private Integer bnum;//库存量
	private Double bprice;//现价
	private Date bdate;
	private Integer num;//存购物车中选中的数量
	private String url;
	private Integer type;//属性 0新书  1文艺，2小说  3.青春  4杂刊  5吃  6港台  7外文 8其他 
	private Integer isRecommend;// 是否推荐，0否  1是 
	private Double price;//原价
	
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBauthor() {
		return bauthor;
	}
	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
	}
	public String getBbrief() {
		return bbrief;
	}
	public void setBbrief(String bbrief) {
		this.bbrief = bbrief;
	}
	public void addNum(){
		this.num++;
	}
	public Integer getBnum() {
		return bnum;
	}
	public void setBnum(Integer bnum) {
		this.bnum = bnum;
	}
	
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getIsRecommend() {
		return isRecommend;
	}
	public void setIsRecommend(Integer isRecommend) {
		this.isRecommend = isRecommend;
	}
	public Double getBprice() {
		return bprice;
	}
	public void setBprice(Double bprice) {
		this.bprice = bprice;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	
	
	
	
	
}
