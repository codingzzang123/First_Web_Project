package exam;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private DataSource ds;
	private Connection conn;
	PreparedStatement pstmt = null;
	
	public MemberDAO() {
		try{
	        Context init = (Context) new InitialContext();
	        ds = (DataSource)init.lookup("java:comp/env/jdbc/myOracle");
	        
	    } catch(Exception e){
	        System.out.println("Exception : " + e);
	    }
	}
	public Connection getConnection() throws SQLException{
        return ds.getConnection();
    }
	public List<MemberVO> selectAll(){

		List<MemberVO> ls = new ArrayList<>();
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER ORDER BY NUM ASC";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //쿼리 전송!
			
			while(rs.next()) {
				MemberVO tmp = new MemberVO(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7),
					rs.getString(8));
				ls.add(tmp);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {		
			try {
				if(pstmt != null)pstmt.close();
				if(rs != null)rs.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return (ls.size() == 0) ? null : ls;
	}
	
	public void updateName(String name) {
		String sql = "UPDATE MEMBER SET NAME = ?" ;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.executeUpdate(sql);
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {		
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
