package order.model;

import java.util.Date;

public class OrderCom {
	private Integer ordercode;
	private String id;
	private Date orderdate;
	private String destination;
	private Integer extendedprice;
	
	public OrderCom(Integer ordercode, String id, Date orderdate, String destination, Integer extendedprice) {
		this.ordercode = ordercode;
		this.id = id;
		this.orderdate = orderdate;
		this.destination = destination;
		this.extendedprice = extendedprice;
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
	
	
}
