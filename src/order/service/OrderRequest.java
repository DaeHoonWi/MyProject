package order.service;

import java.util.Map;

public class OrderRequest {

	private String id;
	private Integer extendedprice;
	private Integer goodscode;//
	private Integer orderamount;//
	private Integer orderprice;//
	private String destination;
	
	public OrderRequest(String id, Integer extendedprice, Integer goodscode, Integer orderamount, Integer orderprice, String destination) {
		this.id = id;
		this.extendedprice = extendedprice;
		this.goodscode = goodscode;
		this.orderamount = orderamount;
		this.orderprice = orderprice;
		this.destination = destination;
	}

	public String getId() {
		return id;
	}

	public Integer getExtendedprice() {
		return extendedprice;
	}

	public Integer getGoodscode() {
		return goodscode;
	}

	public Integer getOrderamount() {
		return orderamount;
	}

	public Integer getOrderprice() {
		return orderprice;
	}

	public String getDestination() {
		return destination;
	}
	
	public void validate(Map<String, Boolean> errors){
		if(destination == null || destination.trim().isEmpty()){
			errors.put("destination", Boolean.TRUE);
		}
	}
	
}
