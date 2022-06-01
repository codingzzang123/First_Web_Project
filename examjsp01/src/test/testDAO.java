package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import board.BoardDAO;
import board.BoardVO;
import template.ConnectionPoolTemplate;

public class testDAO {
	private ConnectionPoolTemplate pool;
	private Connection conn;
	PreparedStatement pstmt = null;
	private static testDAO instance = null;
	private testDAO() {
		pool = ConnectionPoolTemplate.getInstance();
	}
	
	public static testDAO getInstance() {
		if(instance == null) {
			synchronized(BoardDAO.class) {
				instance = new testDAO();
			}
		}
		return instance;
	}
	
	public void insert(String name,String img, String imgcode) {
		String sql = "insert into member values(?,?,?)";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, img);
			pstmt.setString(3, imgcode);
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
	
	public List<testVO> selectAll(){
		String sql = "select * from member";
		
		ResultSet rs = null;
		List<testVO> ls = new ArrayList<>();
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery(); 
			while(rs.next()) {
				testVO tmp = new testVO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3));
						
				ls.add(tmp);
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
	
	public testVO select(String name) {
String sql = "select * from member where name = ?";
testVO tmp=null;
		ResultSet rs = null;
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs= pstmt.executeQuery(); 
			while(rs.next()) {
				tmp = new testVO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3));
						
				
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
		return tmp;
	}
}
