package order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jdbc.JdbcUtil;
import order.model.OrderCom;
import order.model.OrderGoodsCom;

public class OrderDao {

	public OrderCom insert(Connection conn, OrderCom orderCom) throws SQLException{
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("insert into porder (id, orderdate, destination, extendedprice, ordername, birth, phonenum, email, detail) values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, orderCom.getId());
			pstmt.setTimestamp(2, toTimestamp(orderCom.getOrderdate()));
			pstmt.setString(3, orderCom.getDestination());
			pstmt.setInt(4, orderCom.getExtendedprice());
			pstmt.setString(5, orderCom.getOrdername());
			pstmt.setInt(6, orderCom.getBirth());
			pstmt.setString(7, orderCom.getPhonenum());
			pstmt.setString(8, orderCom.getEmail());
			pstmt.setString(9, orderCom.getDetail());
			
			int insertedCount = pstmt.executeUpdate();
			
			if(insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from porder");
				if(rs.next()){
					Integer newNum = rs.getInt(1); //getInt(1) : 1번째 index column 선택
					return new OrderCom(newNum, orderCom.getId(), orderCom.getOrderdate(), 
										orderCom.getDestination(), orderCom.getExtendedprice(), orderCom.getOrdername(),
										orderCom.getBirth(), orderCom.getPhonenum(), orderCom.getEmail(),
										orderCom.getDetail());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}
	
	private Timestamp toTimestamp(Date date){
		return new Timestamp(date.getTime());
	}
	
	public void increaseSalesVolume(Connection conn, int goodscode, int orderamount) throws SQLException{
		try(PreparedStatement pstmt = conn.prepareStatement("update goods set salesvolume = salesvolume + ? where goodscode = ?;")){
			pstmt.setInt(1, orderamount);
			pstmt.setInt(2, goodscode);
			pstmt.executeUpdate();
		}
	}
	
	public void minusAmount(Connection conn, int goodscode, int orderamount) throws SQLException{
		try(PreparedStatement pstmt = conn.prepareStatement("update goods set goodsamount = goodsamount - ? where goodscode = ?;")){
			pstmt.setInt(1, orderamount);
			pstmt.setInt(2, goodscode);
			pstmt.executeUpdate();
		}
	}
	
	public List<OrderCom> select(Connection conn, String userId) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from porder "
										+"where id = ?"
										+"order by orderdate desc");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			List<OrderCom> result = new ArrayList<>();
			while(rs.next()){
				result.add(convertOrder(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);		
		}
	}
	
	private OrderCom convertOrder(ResultSet rs) throws SQLException{
		return new OrderCom(rs.getInt("ordercode"), rs.getString("id"), toDate(rs.getTimestamp("orderdate")), 
				rs.getString("orderdate"), rs.getInt("extendedprice"), rs.getString("ordername"), 
				rs.getInt("birth"), rs.getString("phonenum"), rs.getString("email"), 
				rs.getString("detail"));
	}
	
	private Date toDate(Timestamp timestamp){
		return new Date(timestamp.getTime());
	}
	
	public List<OrderGoodsCom> verify(Connection conn, int ordercode) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from ordergoods "
										+"where ordercode = ?");
			pstmt.setInt(1, ordercode);
			rs = pstmt.executeQuery();
			List<OrderGoodsCom> result = new ArrayList<>();
			while(rs.next()){
				result.add(convertOrderGoods(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);		
		}
	}
	
	private OrderGoodsCom convertOrderGoods(ResultSet rs) throws SQLException{
		return new OrderGoodsCom(rs.getInt("ordercode"), rs.getInt("goodscode"), 
								rs.getInt("orderamount"), rs.getInt("orderprice"));
	}
}
