package order.service;

import order.model.Order;

public class OrderService {

	public Order save(Integer goodscode, Integer orderamount, String goodsname, Integer unitprice, Integer orderprice, Integer extendedprice){
		
		orderprice = unitprice * orderamount;
		extendedprice = orderprice;
		
		return new Order(goodscode, orderamount, goodsname, unitprice, orderprice, extendedprice);
	}
}
