package goods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import goods.model.Goods;
import jdbc.JdbcUtil;

public class GoodsDao {

	public Goods Insert(Connection conn, Goods goods) throws SQLException{
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("insert into goods " 
										+ "(goodsamount, unitprice, goodsname, seperator, comment) "
										+ "values(?,?,?,?,?)");
			pstmt.setInt(1, goods.getGoodsamount());
			pstmt.setInt(2, goods.getUnitprice());
			pstmt.setString(3, goods.getGoodsname());
			pstmt.setString(4, goods.getSeperator());
			pstmt.setString(5, goods.getComment());
			int insertedCount = pstmt.executeUpdate();
			
			if(insertedCount > 0){
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from goods");	//같은 Connection 에서 가장 최근에 insert 된 row의 auto increment column 의 값을 반환한다.
				if(rs.next()){
					Integer newNum = rs.getInt(1);
					return new Goods(newNum, 
							goods.getGoodsamount(), 
							goods.getUnitprice(), 
							goods.getGoodsname(), 
							goods.getSeperator(),
							goods.getComment());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from goods");
			if(rs.next()){
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public List<Goods> select(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from goods "+
											"order by goodscode desc limit ?, ?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<Goods> result = new ArrayList<>();
			while(rs.next()){
				result.add(convertGoods(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	private Goods convertGoods(ResultSet rs) throws SQLException {
		return new Goods(null,
				rs.getInt("goodsamount"),
				rs.getInt("unitprice"),
				rs.getString("goodsname"),
				rs.getString("seperator"),
				null);
	}
}
