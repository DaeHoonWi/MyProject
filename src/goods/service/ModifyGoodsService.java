package goods.service;

import java.sql.Connection;
import java.sql.SQLException;

import goods.dao.GoodsDao;
import goods.model.Goods;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ModifyGoodsService {
	
	private GoodsDao goodsDao = new GoodsDao();
	
	public void modify(ModifyRequest modReq){
		Connection conn = null;
		try{
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Goods goods = goodsDao.selectById(conn, modReq.getGoodscode());
			if(goods == null) {
				throw new GoodsNotFoundException();
			}
			goodsDao.update(conn, modReq.getGoodscode(), modReq.getGoodsamount(), modReq.getUnitprice(), modReq.getGoodsname(), modReq.getSeperator(), modReq.getComment());
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	} 
}
