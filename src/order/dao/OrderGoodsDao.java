package order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<OrderGoodsCom> select(Connection conn, int ocode) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement("select * from ordergoods"
										+"where ordercode = ?");
			pstmt.setInt(1, ocode);
			rs = pstmt.executeQuery();
			List<OrderGoodsCom> result = new ArrayList<>();
			while (rs.next()){
				result.add(convertOrderGoodsCom(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	private OrderGoodsCom convertOrderGoodsCom(ResultSet rs)throws SQLException {
		return new OrderGoodsCom(rs.getInt("ordercode"), rs.getInt("goodscode"), 
								rs.getInt("orderamount"), rs.getInt("orderprice"));
	}
}
