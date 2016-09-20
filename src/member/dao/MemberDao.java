package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import member.model.Member;

public class MemberDao {
	
	public Member selectById(Connection conn, String id) throws SQLException{ 				//member 테이블에서 memberid 칼럼 값이 id 파라마티와 동일한 데이터를 조회한다
		PreparedStatement pstmt = null;														//데이터가 존재하면 if문을 통해 Member 객체를 생성한다.
		ResultSet rs = null;																//데이터가 존재하지 않으면 null을 반환한다.
		try {
			pstmt = conn.prepareStatement("select * from member where memberid = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			Member member = null;
			if(rs.next()){
				member = new Member(
						rs.getString("memberid"),
						rs.getString("name"),
						rs.getString("password"),
						toDate(rs.getTimestamp("regdate")));	
			}
		return member;
		
		} finally {
		}
	}

	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}
	
	public void insert(Connection conn, Member mem) throws SQLException{							//member 테이블에 데이터 추가
		try(PreparedStatement pstmt = conn.prepareStatement("insert into member values(?,?,?,?)")){	//
			pstmt.setString(1, mem.getId());														//
			pstmt.setString(2, mem.getPassword());													//
			pstmt.setString(3, mem.getName());														//
			pstmt.setTimestamp(4, new Timestamp(mem.getRegDate().getTime()));						//
			pstmt.executeUpdate();																	//
		}
	}
	
	public void update(Connection conn, Member member) throws SQLException{
		try(PreparedStatement pstmt= conn.prepareStatement("update member set name = ?, password = ? where memberid = ?")){
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getId());
			pstmt.executeUpdate();
		}
	}
}
