package order.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

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
	
	public Order save(Integer goodscode, Integer orderamount, String goodsname, Integer unitprice, Integer orderprice, Integer extendedprice, String seperator){
		
		orderprice = unitprice * orderamount;
		extendedprice = orderprice;
		
		return new Order(goodscode, orderamount, goodsname, unitprice, orderprice, extendedprice, seperator);
	}
	
	public Integer write(OrderRequest req, boolean increaseSalesVolume){
		Connection conn = null;
		
		try{
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			OrderCom order = new OrderCom(null, 
										req.getId(), 
										new Date(), 
										req.getDestination(), 
										req.getExtendedprice(),
										req.getOrdername(),
										req.getBirth(),
										req.getPhonenum(),
										req.getEmail(),
										req.getDetail());
					
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
			
			if(increaseSalesVolume){
				orderDao.increaseSalesVolume(conn, req.getGoodscode(), req.getOrderamount());
				orderDao.minusAmount(conn, req.getGoodscode(), req.getOrderamount());
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
	
	public OrderData getOrder(String userId){
		try(Connection conn = ConnectionProvider.getConnection()){
			List<OrderCom> orderCom = orderDao.select(conn, userId);
			
			return new OrderData(orderCom, null);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public OrderData getVerify(int ordercode){
		try(Connection conn = ConnectionProvider.getConnection()){
			List<OrderGoodsCom> orderGoodsCom = orderDao.verify(conn, ordercode);
			
			return new OrderData(null, orderGoodsCom);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
}
