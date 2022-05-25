package user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import template.ConnectionPoolTemplate;

public class userDAO {
	private ConnectionPoolTemplate pool;
	private Connection conn;
	PreparedStatement pstmt = null;
	public userDAO() {
		pool = ConnectionPoolTemplate.getInstance();
	}
	public List<userVO> selectAll(){
		List<userVO> ls = new ArrayList<>();
		ResultSet rs = null;
		String sql = "SELECT * FROM \"USER\"";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //쿼리 전송!
			
			while(rs.next()) {
				userVO tmp = new userVO(
					rs.getString(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4)
					);
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
	
	public void insertUser(String id, String pw, String age, String comment) {
		String sql = "INSERT INTO \"USER\" VALUES(?,?,?,?)";
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, age);
			pstmt.setString(4, comment);
			pstmt.executeQuery(); 
			
			
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
	public boolean idCheck(String id){
		
		ResultSet rs = null;
		String sql = "select \"ID\" from \"USER\" where \"ID\"=?";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(!rs.next()){ //false이면 중복된값이 없는것?
				return false;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally {		
			try {
				if(pstmt != null)pstmt.close();
				if(rs != null)rs.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	public boolean isMember(String id, String pw) {
		ResultSet rs = null;
		String sql = "SELECT * FROM \"USER\" WHERE \"ID\"=? AND \"PW\"=?";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(!rs.next()){ //false 는 로그인  실패..
				return false;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally {		
			try {
				if(pstmt != null)pstmt.close();
				if(rs != null)rs.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
}
