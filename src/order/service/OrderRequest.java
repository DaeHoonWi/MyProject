package order.service;

import java.util.Map;

public class OrderRequest {

	private String id;
	private Integer extendedprice;
	private Integer goodscode;
	private Integer orderamount;
	private Integer orderprice;
	private String destination;
	
	private String ordername;
	private Integer birth;
	private String phonenum;
	private String email;
	private String detail;
	
	public OrderRequest(String id, Integer extendedprice, Integer goodscode, 
						Integer orderamount, Integer orderprice, String destination, 
						String ordername, Integer birth, String phonenum, 
						String email, String detail) {
		this.id = id;
		this.extendedprice = extendedprice;
		this.goodscode = goodscode;
		this.orderamount = orderamount;
		this.orderprice = orderprice;
		this.destination = destination;
		
		this.ordername = ordername;
		this.birth = birth;
		this.phonenum = phonenum;
		this.email = email;
		this.detail = detail;
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

	public void validate(Map<String, Boolean> errors){
		if(destination == null || destination.trim().isEmpty()){
			errors.put("destination", Boolean.TRUE);
		}
		if(ordername == null || ordername.trim().isEmpty()){
			errors.put("ordername", Boolean.TRUE);
		}
		if(phonenum == null || phonenum.trim().isEmpty()){
			errors.put("phonenum", Boolean.TRUE);
		}
		if(email == null || email.trim().isEmpty()){
			errors.put("email", Boolean.TRUE);
		}
	}
}
