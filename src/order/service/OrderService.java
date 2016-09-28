package order.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import order.dao.OrderDao;
import order.dao.OrderGoodsDao;
import order.model.Order;
import order.model.OrderCom;
import order.model.OrderGoodsCom;

public class OrderService {

	private OrderDao orderDao = new OrderDao();
	private OrderGoodsDao orderGoodsDao = new OrderGoodsDao();
	
	public Order save(Integer goodscode, Integer orderamount, String goodsname, Integer unitprice, Integer orderprice, Integer extendedprice){
		
		orderprice = unitprice * orderamount;
		extendedprice = orderprice;
		
		return new Order(goodscode, orderamount, goodsname, unitprice, orderprice, extendedprice);
	}
	
	public Integer write(OrderRequest req){
		Connection conn = null;
		
		try{
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			//OrderCom order = toOrderCom(req);
			OrderCom order = new OrderCom(null, 
										req.getId(), 
										new Date(), 
										req.getDestination(), 
										req.getExtendedprice());
					
			OrderCom savedOrder = orderDao.insert(conn, order);
			if(savedOrder == null) {
				throw new RuntimeException("fail to insesrt order");
			}
			OrderGoodsCom orderGoods = new OrderGoodsCom(savedOrder.getOrdercode(), 
														req.getGoodscode(), 
														req.getOrderamount(), 
														req.getOrderprice());
			OrderGoodsCom savedOrderGoods = orderGoodsDao.insert(conn, orderGoods);
			if(savedOrderGoods == null) {
				throw new RuntimeException("fail to insert orderGoods");
			}
			
			conn.commit();
			
			return savedOrder.getOrdercode();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	private OrderCom toOrderCom(OrderRequest req){
		Date now = new Date();
		return new OrderCom(null, req.getId(), now, req.getDestination(), req.getExtendedprice());
	}
}
