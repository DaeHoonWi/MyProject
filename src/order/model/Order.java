package order.model;

public class Order {

	private Integer goodscode;
	private Integer orderamount;
	private String goodsname;
	private Integer unitprice;
	private Integer orderprice;
	private Integer extendedprice;
	
	public Order(Integer goodscode, Integer orderamount, String goodsname, Integer unitprice, Integer orderprice, Integer extendedprice) {
		this.goodscode = goodscode;
		this.orderamount = orderamount;
		this.goodsname = goodsname;
		this.unitprice = unitprice;
		this.orderprice = orderprice;
		this.extendedprice = extendedprice;
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
	
	
}
