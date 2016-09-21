package goods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import goods.model.Goods;
import jdbc.JdbcUtil;

public class GoodsDao {

	public Goods Insert(Connection conn, Goods goods) throws SQLException{
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("insert into goods " 
										+ "(goodsamount, unitprice, goodsname, seperator) "
										+ "values(?,?,?,?)");
			pstmt.setInt(1, goods.getGoodsamount());
			pstmt.setInt(2, goods.getUnitprice());
			pstmt.setString(3, goods.getGoodsname());
			pstmt.setString(4, goods.getSeperator());
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
							goods.getSeperator());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}
}
