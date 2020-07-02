package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mvc.database.DBConnection;


public class BoardDAO {
	private static BoardDAO instance;
	private BoardDAO() {}
	
	
	public static BoardDAO getInstance() {
		if (instance == null) instance = new BoardDAO();
		return instance;
	}
	
	
	/* board 테이블의 레코드 개수 */
	/* items : 제목,내용,작성자로 검색
	 * text : 찾고자 하는 내용 */
	public int getListCount(String items, String text,String category) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		String sql;
	
		/* 찾고자 하는 내용이 없으면 전체 개수 검색 */
		if (items == null && text == null) sql = "select count(*) from board";
		
		/* 찾고자 하는 내용이 있으면 조건에 따른 개수 검색 */
		else sql = "SELECT count(*) FROM board where " + items + " like '%" + text +"%'";
	
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			if (rs.next()) x = rs.getInt(1); // 첫번째 칼럼의 값 가져오기(개수)
		} catch (Exception ex) {
			System.out.println("getListCount() 에러: " + ex.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return x; // 검색한 칼럼의 개수를 반환
	}
	
	
	/* board 테이블의 레코드 가져오기 */
	/* page : 현재 페이지(한 페이지당 보여지는 행의 수)
	 * limit : 검색종류
	 * text : 검색어
	 * */
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text,String category) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		/* 조건에 만족하는 총 데이터 개수 가져오기 */
		int total_record = getListCount(items, text,category );
		
		/* 페이지당 5개씩 보여주기 위한 조건 */
		int start = (page - 1) * limit;
		int index = start + 1;
	
		String sql;
		if (items == null && text == null) sql = "select *, @SEQ := @SEQ+1 AS SEQ from board, (SELECT @SEQ := 0) A where category='"+category+"' ORDER BY num DESC";
		else sql = "SELECT *, @SEQ := @SEQ+1 AS SEQ FROM board, (SELECT @SEQ := 0) A where " + items + " like '%" + text + "%' and category='"+category+"' ORDER BY num DESC ";
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
	
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			
		/* absolute(숫자) : 숫자에 해당하는 행의 위치로 이동 
		 * while문을 통해 index에 해당하는 칼럼값들을 rs에서 들고와서
		 * boardDTO에 세팅 후
		 * 통째로 ArrayList 변수인 list에 담기
		 * */
		while (rs.absolute(index)) {
			BoardDTO board = new BoardDTO();
			
			board.setNum(rs.getInt("num"));
			board.setId(rs.getString("id"));
			board.setName(rs.getString("name"));
			board.setSubject(rs.getString("subject"));
			board.setContent(rs.getString("content"));
			board.setRegdate(rs.getString("regdate"));
			board.setHit(rs.getInt("hit"));
			board.setIp(rs.getString("ip"));
			board.setIp(rs.getString("category"));
			
			list.add(board);
			
			/* 반복문 탈출 조건 : 
			 * 위에서 세팅한 페이지당 5개의 칼럼이 아니면 반복문 탈출 */
			if (index < (start + limit) && index <= total_record) index++;
			else break;
		}
		return list;
		} catch (Exception ex) {
			System.out.println("getBoardList() 에러 : " + ex.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}
	
	
	/* member 테이블에서 인증된 id의 사용자명 가져오기 */
	public String getLoginNameById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String name=null;
		String sql = "select * from member where id = ? ";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) name = rs.getString("name");
			return name;
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 에러 : " + ex.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}
	
	
	
	/* board 테이블에 새로운 글 삽입히가 */
	public void insertBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getId());
			pstmt.setString(3, board.getName());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getRegdate());
			pstmt.setInt(7, board.getHit());
			pstmt.setString(8, board.getIp());
			pstmt.setString(9, board.getCategory());
			
			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("insertBoard() 에러 : " + ex.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	
	
	
	/* 선택된 글의 조회수 증가하기 */
	public void updateHit(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "select hit from board where num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			int hit = 0;
			if (rs.next()) hit = rs.getInt("hit") + 1;
			
			sql = "update board set hit=? where num=?";
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hit);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
				System.out.println("updateHit() 에러 : " + ex.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
			}
			}
	}
	
	
	/* 선택된 글 상세 내용 가져오기 */
	public BoardDTO getBoardByNum(int num, int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = null;
		
		updateHit(num); // 게시판 조회수 증가
		String sql = "select * from board where num = ? ";
					
		try {
			conn = DBConnection.getConnection();	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
					
			if (rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getString("regdate"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				board.setCategory(rs.getString("category"));
			}
			return board;
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 에러 : " + ex.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	return null;
	}
				
				
	/* 선택된 글 내용 수정하기 */
	public void updateBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
				
		try {
			String sql = "update board set subject=?, content=? where num=?";
				
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			conn.setAutoCommit(false);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNum());
			
			pstmt.executeUpdate();
			conn.commit();
		} catch (Exception ex) {
			System.out.println("updateBoard() 에러 : " + ex.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	
	
	/* 선택된 글 삭제하기 */
	public void deleteBoard(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from board where num=?";
				
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteBoard() 에러 : " + ex.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}

}	