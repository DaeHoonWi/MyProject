package order.model;

public class OrderGoodsCom {

	private Integer ordercode;
	private Integer goodscode;
	private Integer orderamount;
	private Integer orderprice;
	
	public OrderGoodsCom(Integer ordercode, Integer goodscode, Integer orderamount, Integer orderprice) {
	this.ordercode = ordercode;
	this.goodscode = goodscode;
	this.orderamount = orderamount;
	this.orderprice = orderprice;	
	}

	public Integer getOrdercode() {
		return ordercode;
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
	
	
}
