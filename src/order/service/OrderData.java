package order.service;

import order.model.OrderCom;
import order.model.OrderGoodsCom;

public class OrderData {

	private OrderCom orderCom;
	private OrderGoodsCom orderGoodsCom;
	
	public OrderData(OrderCom orderCom, OrderGoodsCom orderGoodsCom){
		this.orderCom = orderCom;
		this.orderGoodsCom = orderGoodsCom;
	}

	public OrderCom getOrderCom() {
		return orderCom;
	}

	public OrderGoodsCom getOrderGoodsCom() {
		return orderGoodsCom;
	}
}
