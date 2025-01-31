package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;
import template.ConnectionPoolTemplate;

public class BoardDAO {
	private ConnectionPoolTemplate pool;
	private Connection conn;
	PreparedStatement pstmt = null;
	private static BoardDAO instance = null;
	private BoardDAO() {
		pool = ConnectionPoolTemplate.getInstance();
	}
	
	public static BoardDAO getInstance() {
		if(instance == null) {
			synchronized(BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}
	
	public List<BoardVO> selectAll(){
		String sql = "SELECT * FROM BOARD";
		ResultSet rs = null;
		List<BoardVO> ls = new ArrayList<>();
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery(); 
			while(rs.next()) {
				BoardVO tmp = new BoardVO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getInt(7));
						
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
	
	public BoardVO select(int num) {
		String sql = "SELECT * FROM BOARD WHERE NUM = ?";
		ResultSet rs = null;
		BoardVO ls = new BoardVO();
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				ls.setNum(rs.getInt(1));
				ls.setSubject(rs.getString(2));
				ls.setContent(rs.getString(3));
				ls.setPubdate(rs.getString(4));
				ls.setMaker(rs.getString(5));
				ls.setClicks(rs.getInt(6));
				ls.setReplys(rs.getInt(7));
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
		return ls == null?  null : ls;
	}
	
	public int getArticleCount(){
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int x = 0;
	    try{
	        conn = pool.getConnection();
	        pstmt = conn.prepareStatement("select count(*) from BOARD");
	        rs = pstmt.executeQuery();
	        if(rs.next()){
	            x = rs.getInt(1);
	        }
	    } catch(Exception e){
	        e.printStackTrace();
	    } finally{
	        if(rs != null) try { rs.close(); } catch (SQLException e){}
	        if(pstmt != null) try { pstmt.close(); } catch (SQLException e){}
	        if(conn != null) try { conn.close(); } catch (SQLException e){}
	    }
	    return x;
	}
	
	public List<BoardVO> getArticles(int start, int end){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardVO> articleList = null;
        try{
            conn = pool.getConnection();
            /* 수정<2> */
            pstmt = conn.prepareStatement(
            		"select NUM, SUBJECT, CONTENT, PUBDATE, MAKER, CLICKS, REPLYS from (select rownum rnum, NUM, SUBJECT, CONTENT, PUBDATE, MAKER,"
            			    + "CLICKS, REPLYS FROM("
            			        + "select * from board order by NUM DESC)) where rnum>=? and rnum<=?"); //수정<3>
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();
            if(rs.next()){
                articleList = new ArrayList<BoardVO>(10); //수정<4>
                do {
                	BoardVO tmp = new BoardVO(
    						rs.getInt(1),
    						rs.getString(2),
    						rs.getString(3),
    						rs.getString(4),
    						rs.getString(5),
    						rs.getInt(6),
    						rs.getInt(7));
    						
    				articleList.add(tmp);
                } while(rs.next());
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            if(rs != null) try { rs.close(); } catch (SQLException e){}
            if(pstmt != null) try { pstmt.close(); } catch (SQLException e){}
            if(conn != null) try { conn.close(); } catch (SQLException e){}
        }
        return articleList;
    }
	public void createBoard(String subject, String content, String maker) {
		String sql = "INSERT INTO BOARD (num,subject,content,pubdate,maker) values (\"SEQ_BOARD\".NEXTVAL,?,?,?,?)";
		
		try {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String pubdate = sdf.format(date);
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, pubdate);
			pstmt.setString(4, maker);
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
	public void clicks(int num) {
		String sql = "UPDATE board SET clicks=clicks+1 where num=?";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	public void delete(int num) {
		String sql = "delete from board where num=?";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	public void update(String subject, String content, int num) {
		String sql = "update board set subject=? , content=? where num = ?";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
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
	public void replys(int num) {
		String sql = "UPDATE board SET replys=replys+1 where num=?";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	public void replysMinus(int num) {
		String sql = "UPDATE board SET replys=replys-1 where num=?";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
