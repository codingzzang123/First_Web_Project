package vote;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import template.ConnectionPoolTemplate;


public class TopicDAO {
	private ConnectionPoolTemplate pool;
	private Connection conn;
	PreparedStatement pstmt = null;
	
	public TopicDAO() {
		pool = ConnectionPoolTemplate.getInstance();
	}
	public TopicVO selectTopic(String sub){
		ResultSet rs = null;
		String sql = "SELECT * FROM TOPIC WHERE SUBJECT = ?";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sub);
			rs = pstmt.executeQuery(); //쿼리 전송!
			
			while(rs.next()) {
				TopicVO tmp = new TopicVO(
					rs.getString(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4)
					);	
				return tmp;
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
		return null;
	}
	
	public boolean checkTopic(String topic) {
		List<TopicVO> ls = selectAll();
		if(ls == null) 
			return true;
		
		for(TopicVO tv : ls) {
			if(topic.equals(tv.getSubject())) {
				return false;
			}
		}
		return true;
	}
	public void insertTopic(String subject, String maker,String content_s) {
		String sql = "INSERT INTO TOPIC VALUES(?,?,?,?)";
		try {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String pubdate = sdf.format(date);
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, maker);
			pstmt.setString(3, pubdate);
			pstmt.setString(4, content_s);
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
	
	
	public List<TopicVO> selectAll(){
		List<TopicVO> ls = new ArrayList<>();
		ResultSet rs = null;
		String sql = "SELECT * FROM TOPIC";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //쿼리 전송!
			
			while(rs.next()) {
				TopicVO tmp = new TopicVO(
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
	public void delete(String subject) {
		String sql = "DELETE FROM \"TOPIC\" WHERE \"SUBJECT\" = ?";
		
		try {
			
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
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
