package entity;

public class Order_Detail {
	private Integer id;
	private T_order order;
	private String name;
	private Double price;
	private Integer num;
	private Double amount;
	

	public Order_Detail() {
		super();
	}

	public Order_Detail(String name, Double price, Integer num ,Double amount) {
		super();
		this.name = name;
		this.price = price;
		this.num = num;
		this.amount=amount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public T_order getOrder() {
		return order;
	}

	public void setOrder(T_order order) {
		this.order = order;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

}
