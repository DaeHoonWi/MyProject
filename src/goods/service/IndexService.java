package goods.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import goods.dao.GoodsDao;
import goods.model.Goods;
import jdbc.connection.ConnectionProvider;

public class IndexService {

	private GoodsDao goodsDao = new GoodsDao();
	
	private int size = 10;
	private int sizeOfBest = 5;
	String sepWine = "와인";
	String sepWhisky = "위스키";
	String sepBrandy = "브랜디";
	
	public GoodsPage getWinePage(int pageNum){
		try(Connection conn = ConnectionProvider.getConnection()){
			int total = goodsDao.selectCount(conn, sepWine);
			List<Goods> content = goodsDao.select(conn, (pageNum-1)*size, size, sepWine);
			return new GoodsPage(total, pageNum, size, content, sepWine);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public GoodsPage getWhiskyPage(int pageNum){
		try(Connection conn = ConnectionProvider.getConnection()){
			int total = goodsDao.selectCount(conn, sepWhisky);
			List<Goods> content = goodsDao.select(conn, (pageNum-1)*size, size, sepWhisky);
			return new GoodsPage(total, pageNum, size, content, sepWhisky);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public GoodsPage getBrandyPage(int pageNum){
		try(Connection conn = ConnectionProvider.getConnection()){
			int total = goodsDao.selectCount(conn, sepBrandy);
			List<Goods> content = goodsDao.select(conn, (pageNum-1)*size, size, sepBrandy);
			return new GoodsPage(total, pageNum, size, content, sepBrandy);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public GoodsPage getBestGoodsPage(int pageNum){
		try(Connection conn = ConnectionProvider.getConnection()){
			int total = goodsDao.selectCountAll(conn);
			List<Goods> content = goodsDao.selectBest(conn, (pageNum-1)*sizeOfBest, sizeOfBest);
			return new GoodsPage(total, pageNum, size, content, null);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
