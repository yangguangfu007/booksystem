package entity;

import java.util.Date;

public class Book {
	private Integer bid;
	private String bname;
	private String bauthor;//����
	private String bbrief;//���
	private Integer bnum;//�����
	private Double bprice;//�ּ�
	private Date bdate;
	private Integer num;//�湺�ﳵ��ѡ�е�����
	private String url;
	private Integer type;//���� 0����  1���գ�2С˵  3.�ഺ  4�ӿ�  5��  6��̨  7���� 8���� 
	private Integer isRecommend;// �Ƿ��Ƽ���0��  1�� 
	private Double price;//ԭ��
	
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
