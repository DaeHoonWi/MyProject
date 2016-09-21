package goods.service;

import java.sql.Connection;
import java.sql.SQLException;

import goods.dao.GoodsDao;
import goods.model.Goods;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class InsertGoodsService {

	private GoodsDao goodsDao = new GoodsDao();
	
	public Integer write(InsertReuqest req){
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Goods goods = toGoods(req);
			Goods savedGoods = goodsDao.Insert(conn, goods);
			if(savedGoods == null){
				throw new RuntimeException("fail to insert goods");
			}
			
			conn.commit();
			
			return savedGoods.getGoodscode();
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
	
	private Goods toGoods(InsertReuqest req){
		return new Goods(null, req.getGoodsamount(), req.getUnitprice(), req.getGoodsname(), req.getSeperator());
	}
}
