package order.service;

import java.util.List;

import order.model.OrderCom;
import order.model.OrderGoodsCom;

public class OrderData {

	private List<OrderCom> orderCom;
	private List<OrderGoodsCom> orderGoodsCom;
	
	public OrderData(List<OrderCom> orderCom, List<OrderGoodsCom> orderGoodsCom){
		this.orderCom = orderCom;
		this.orderGoodsCom = orderGoodsCom;
	}

	public List<OrderCom> getOrderCom() {
		return orderCom;
	}

	public List<OrderGoodsCom> getOrderGoodsCom() {
		return orderGoodsCom;
	}
}
