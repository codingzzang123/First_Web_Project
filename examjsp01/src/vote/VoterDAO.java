package vote;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import template.ConnectionPoolTemplate;

public class VoterDAO {
	
	private ConnectionPoolTemplate pool;
	private Connection conn;
	PreparedStatement pstmt = null;
	
	public VoterDAO(){
		pool = ConnectionPoolTemplate.getInstance();
	}
	
	public void insertInfo(String user, String subject, String chname) {
		String sql = "INSERT INTO VOTER VALUES(?,?,?)";
		
		try {
			
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user);
			pstmt.setString(2, subject);
			pstmt.setString(3, chname);
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
	
	public List<String> getVoter(String subject) {
		String sql = "SELECT \"USER\" FROM VOTER WHERE SUBJECT = ?";
		List<String> ls = new ArrayList<>();
		ResultSet rs = null;
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			rs= pstmt.executeQuery(); 
			while(rs.next()) {
				ls.add(rs.getString(1));
			}
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
		return (ls.size() == 0) ? null : ls;
	}
	public void deleteVoter(String user, String subject) {
		String sql = "DELETE FROM VOTER WHERE \"USER\" = ? AND \"SUBJECT\" = ?";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user);
			pstmt.setString(2, subject);
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
}
