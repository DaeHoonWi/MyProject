package order.model;

import java.util.Date;

public class OrderCom {
	private Integer ordercode;
	private String id;
	private Date orderdate;
	private String destination;
	private Integer extendedprice;
	
	private String ordername;
	private Integer birth;
	private String phonenum;
	private String email;
	private String detail;
	
	public OrderCom(Integer ordercode, String id, Date orderdate, 
					String destination, Integer extendedprice, String ordername, 
					Integer birth, String phonenum,	String email, 
					String detail) {
		this.ordercode = ordercode;
		this.id = id;
		this.orderdate = orderdate;
		this.destination = destination;
		this.extendedprice = extendedprice;
		
		this.ordername = ordername;
		this.birth = birth;
		this.phonenum = phonenum;
		this.email = email;
		this.detail = detail;
	}

	public Integer getOrdercode() {
		return ordercode;
	}

	public String getId() {
		return id;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public String getDestination() {
		return destination;
	}

	public Integer getExtendedprice() {
		return extendedprice;
	}
	
	public String getOrdername() {
		return ordername;
	}

	public Integer getBirth() {
		return birth;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public String getEmail() {
		return email;
	}

	public String getDetail() {
		return detail;
	}
}
