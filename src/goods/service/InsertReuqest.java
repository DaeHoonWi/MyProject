package goods.service;

import java.util.Map;

public class InsertReuqest {

	private Integer goodsamount;
	private Integer unitprice;
	private String goodsname;
	private String seperator;
	private String comment;
	
	public InsertReuqest(Integer goodsamount, Integer unitprice, String goodsname, String seperator, String comment) {
		this.goodsamount = goodsamount;
		this.unitprice = unitprice;
		this.goodsname = goodsname;
		this.seperator = seperator;
		this.comment = comment;
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

	public void validate(Map<String, Boolean> errors) {
		checkEmptyInt(errors, goodsamount, "goodsamount");
		checkEmptyInt(errors, unitprice, "unitprice");
		checkEmptyString(errors, goodsname, "goodsname");
		checkEmptyString(errors, seperator, "seperator");
	}
	
	private void checkEmptyInt(Map<String, Boolean> errors, Integer value, String fieldName){	//value가 값이 없는 경우 errors맵 객체의 fieldName키에 TRUE를 값으로 추가한다.
		if(value == null)												//
			errors.put(fieldName, Boolean.TRUE);											//
	}
	
	private void checkEmptyString(Map<String, Boolean> errors, String value, String fieldName){	//value가 값이 없는 경우 errors맵 객체의 fieldName키에 TRUE를 값으로 추가한다.
		if(value == null || value.isEmpty())												//
			errors.put(fieldName, Boolean.TRUE);											//
	}
}
