package order.model;

public class Order {

	private Integer goodscode;
	private Integer orderamount;
	private String goodsname;
	private Integer unitprice;
	private Integer orderprice;		//합계
	private Integer extendedprice;	//총계
	private String	seperator;
	
	public Order(Integer goodscode, Integer orderamount, String goodsname, Integer unitprice, Integer orderprice, Integer extendedprice, String seperator) {
		this.goodscode = goodscode;
		this.orderamount = orderamount;
		this.goodsname = goodsname;
		this.unitprice = unitprice;
		this.orderprice = orderprice;
		this.extendedprice = extendedprice;
		this.seperator = seperator;
	}

	public Integer getGoodscode() {
		return goodscode;
	}

	public Integer getOrderamount() {
		return orderamount;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public Integer getUnitprice() {
		return unitprice;
	}

	public Integer getOrderprice() {
		return orderprice;
	}

	public Integer getExtendedprice() {
		return extendedprice;
	}

	public String getSeperator() {
		return seperator;
	}
	
	
}
