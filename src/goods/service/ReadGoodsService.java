package goods.service;

import java.sql.Connection;
import java.sql.SQLException;

import goods.dao.GoodsDao;
import goods.model.Goods;
import jdbc.connection.ConnectionProvider;

public class ReadGoodsService {

	private GoodsDao goodsDao = new GoodsDao();
	
	public Goods getGoods(int goodsNum) {
		try(Connection conn = ConnectionProvider.getConnection()){
			Goods goods = goodsDao.selectById(conn, goodsNum);
			if(goods == null){
				throw new GoodsNotFoundException();
			}
			return goods;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
