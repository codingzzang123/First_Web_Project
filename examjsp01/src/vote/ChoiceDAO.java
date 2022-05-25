package vote;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import template.ConnectionPoolTemplate;

public class ChoiceDAO {
	private ConnectionPoolTemplate pool;
	private Connection conn;
	PreparedStatement pstmt = null;
	
	public ChoiceDAO() {
		pool = ConnectionPoolTemplate.getInstance();
	}
	public void insertChoice(String subject,String chname, String chcom) {
		String sql = "INSERT INTO CHOICE(TOPIC,CHNAME,CHCOM) VALUES(?,?,?)";
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, chname);
			pstmt.setString(3, chcom);
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
	
	public List<ChoiceVO> selectChoice(String topic) {
		List<ChoiceVO> ls = new ArrayList<>();
		ResultSet rs = null;
		String sql = "SELECT * FROM CHOICE WHERE TOPIC = ?";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, topic);
			rs = pstmt.executeQuery(); //쿼리 전송!
			
			while(rs.next()) {
				ChoiceVO tmp = new ChoiceVO(
					rs.getString(1),
					rs.getString(2),
					rs.getString(3),
					rs.getInt(4)
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
	public void updateCount(String chname, String topic) {
		String sql = "UPDATE CHOICE SET COUNT=COUNT+1 WHERE CHNAME=? AND TOPIC=?";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chname);
			pstmt.setString(2, topic);
			pstmt.executeQuery(); //쿼리 전송!

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
	public void updateCountMinus(String user,String subject){
		String sql = "UPDATE \"CHOICE\" SET COUNT=COUNT-1 WHERE \"TOPIC\" = ? AND \"CHNAME\" = (SELECT \"CHNAME\" FROM \"VOTER\" WHERE \"USER\" = ? AND \"SUBJECT\" = ?)";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, user);
			pstmt.setString(3, subject);
			pstmt.executeQuery(); //쿼리 전송!

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
