package goods.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import goods.dao.GoodsDao;
import goods.model.Goods;
import jdbc.connection.ConnectionProvider;

public class ListGoodsService {

	private GoodsDao goodsDao = new GoodsDao();
	//private int size = 20;
	
	public GoodsPage getGoodsPage(int pageNum, String sep, int size){
		try(Connection conn = ConnectionProvider.getConnection()){
			int total = goodsDao.selectCount(conn, sep);
			List<Goods> content = goodsDao.select(conn, (pageNum-1)*size, size, sep);
			return new GoodsPage(total, pageNum, size, content, sep);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
