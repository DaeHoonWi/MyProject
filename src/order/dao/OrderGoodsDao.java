package order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import order.model.OrderGoodsCom;

public class OrderGoodsDao {

	public OrderGoodsCom insert(Connection conn, OrderGoodsCom orderGoods) throws SQLException{
		PreparedStatement pstmt = null;
		
		try{
			pstmt = conn.prepareStatement("insert into ordergoods (ordercode, goodscode, orderamount, orderprice) "
											+ "values (?,?,?,?)");
			pstmt.setInt(1, orderGoods.getOrdercode());
			pstmt.setInt(2, orderGoods.getGoodscode());
			pstmt.setInt(3, orderGoods.getOrderamount());
			pstmt.setInt(4, orderGoods.getOrderprice());
			int insertedCount = pstmt.executeUpdate();
			if(insertedCount > 0){
				return orderGoods;
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
