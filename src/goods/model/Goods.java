package goods.model;

public class Goods {

	private Integer goodscode;			//code : 관리자 계정에 의해 수동으로 입력 받아야 함
	private Integer goodsamount;
	private Integer unitprice;
	private String goodsname;
	private String seperator;		// 상품 종류(wine, brandy, ...)
	private String comment;
	
	public Goods(Integer goodscode, Integer goodsamount, Integer unitprice, String goodsname, String seperator, String comment) {
		this.goodscode = goodscode;
		this.goodsamount = goodsamount;
		this.unitprice = unitprice;
		this.goodsname = goodsname;
		this.seperator = seperator;
		this.comment = comment;
	}

	public Integer getGoodscode() {
		return goodscode;
	}

	public Integer getGoodsamount() {
		return goodsamount;
	}

	public Integer getUnitprice() {
		return unitprice;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public String getSeperator() {
		return seperator;
	}

	public String getComment() {
		return comment;
	}
	
	
}
