package entity;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	//主键是书的编号，值是商品
	private Map<Integer, Book> map=new HashMap<Integer, Book>();

	public Map<Integer, Book> getMap() {
		return map;
	}

	public void setMap(Map<Integer, Book> map) {
		this.map = map;
	}

	
}
