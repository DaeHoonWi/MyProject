package order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;

import jdbc.JdbcUtil;
import order.model.OrderCom;

public class OrderDao {

	public OrderCom insert(Connection conn, OrderCom order) throws SQLException{
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("insert into order (id, orderdate, destination, extendedprice) values(?,?,?,?)");
			pstmt.setString(1, order.getId());
			pstmt.setTimestamp(2, toTimestamp(order.getOrderdate()));
			pstmt.setString(3, order.getDestination());
			pstmt.setInt(4, order.getExtendedprice());
		
			int insertedCount = pstmt.executeUpdate();
			
			if(insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from order");
				if(rs.next()){
					Integer newNum = rs.getInt(1); //getInt(1) : 1번째 index column 선택
					return new OrderCom(newNum, order.getId(), order.getOrderdate(), order.getDestination(), order.getExtendedprice());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(conn);
		}
	}
	
	private Timestamp toTimestamp(Date date){
		return new Timestamp(date.getTime());
	}
}
