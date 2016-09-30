package order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import order.model.OrderGoodsCom;

public class OrderGoodsDao {

	public OrderGoodsCom insert(Connection conn, OrderGoodsCom orderGoodsCom) throws SQLException{
		PreparedStatement pstmt = null;
		
		try{
			pstmt = conn.prepareStatement("insert into ordergoods (ordercode, goodscode, orderamount, orderprice) "
											+ "values (?,?,?,?)");
			pstmt.setInt(1, orderGoodsCom.getOrdercode());
			pstmt.setInt(2, orderGoodsCom.getGoodscode());
			pstmt.setInt(3, orderGoodsCom.getOrderamount());
			pstmt.setInt(4, orderGoodsCom.getOrderprice());
			int insertedCount = pstmt.executeUpdate();
			
			if(insertedCount > 0){
				return orderGoodsCom;
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
