package co.mask.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.mask.board.vo.BoardVo;
import co.mask.common.DAO;

public class BoardDao extends DAO {

	private PreparedStatement psmt;
	private ResultSet rs;

	private static BoardDao instance;

	public BoardDao() {
		super();
	}

	public static BoardDao getInstance() {
		if (instance == null)
			instance = new BoardDao();
		return instance;
	}

	public ArrayList<BoardVo> selectList() { // 조회
		ArrayList<BoardVo> list = new ArrayList<BoardVo>();
		BoardVo vo;
		String sql = "SELECT * FROM BOARD where boardvalue='notice' ORDER BY boardnumber DESC";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new BoardVo();
				vo.setBoardNumber(rs.getInt("boardnumber"));
				vo.setBoardTitle(rs.getString("boardtitle"));
				vo.setBoardWriter(rs.getString("boardwriter"));
				vo.setBoardContent(rs.getString("boardcontent"));
				vo.setBoardDate(rs.getDate("boarddate"));
				vo.setBoardValue(rs.getString("boardvalue"));
				vo.setBoardHit(rs.getInt("boardhit"));
				vo.setProductseller(rs.getString("seller"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public ArrayList<BoardVo> selectListSell(BoardVo vo) { // 조회
		ArrayList<BoardVo> list = new ArrayList<BoardVo>();
		//BoardVo vo;
		String sql = "SELECT * FROM BOARD where boardvalue='questions' and seller = ? ORDER BY boardnumber DESC";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getProductseller());
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new BoardVo();
				vo.setBoardNumber(rs.getInt("boardnumber"));
				vo.setBoardTitle(rs.getString("boardtitle"));
				vo.setBoardWriter(rs.getString("boardwriter"));
				vo.setBoardContent(rs.getString("boardcontent"));
				vo.setBoardDate(rs.getDate("boarddate"));
				vo.setBoardValue(rs.getString("boardvalue"));
				vo.setBoardHit(rs.getInt("boardhit"));
				vo.setProductseller(rs.getString("seller"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public ArrayList<BoardVo> selectList2() { // 조회
		ArrayList<BoardVo> list = new ArrayList<BoardVo>();
		BoardVo vo;
		String sql = "SELECT * FROM BOARD where boardvalue='questions' ORDER BY boardnumber DESC";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new BoardVo();
				vo.setBoardNumber(rs.getInt("boardnumber"));
				vo.setBoardTitle(rs.getString("boardtitle"));
				vo.setBoardWriter(rs.getString("boardwriter"));
				vo.setBoardContent(rs.getString("boardcontent"));
				vo.setBoardDate(rs.getDate("boarddate"));
				vo.setBoardValue(rs.getString("boardvalue"));
				vo.setBoardHit(rs.getInt("boardhit"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public int boardInsert(BoardVo vo) {
		int n = 0;
		
		String sql = "INSERT INTO BOARD " + "(BOARDNUMBER, BOARDWRITER, BOARDTITLE, BOARDCONTENT, boardvalue, seller)"
				+ "VALUES(board_seq.nextval,?,?,?,?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, vo.getBoardWriter());
			psmt.setString(2, vo.getBoardTitle());
			psmt.setString(3, vo.getBoardContent());
			psmt.setString(4, vo.getBoardValue());
			psmt.setString(5, vo.getProductseller());
			
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(); 
		}
		return n;
	}
	

	public int deleteBoard(BoardVo vo) {
		// 삭제 쿼리
		int n = 0;
		String sql = "DELETE FROM BOARD WHERE BOARDNUMBER=?";
		try {

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardNumber());
			n = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	public void reWriteBoard(BoardVo vo) {
		// 답글
	}

//	public ArrayList<BoardVo> getBoardList

	public void close() { // close 메소드
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int getSeq() {
		int result = 1;

		try {
			conn = DBConnection.getConnection();

			// 시퀀스 값을 가져온다 (dual: 시퀀스값 가져오는 임시테이블)
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT BOARDNUMBER.NEXTVAL FROM DUAL");

			psmt = conn.prepareStatement(sql.toString());

			rs = psmt.executeQuery();

			if (rs.next())
				result = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		}
		close();

		return result;
	}

	public BoardVo select(BoardVo vo) {
		String sql1 = "SELECT * FROM BOARD WHERE BOARDNUMBER=?";
		String sql2="UPDATE BOARD SET BOARDHIT = BOARDHIT + 1 WHERE BOARDNUMBER = ?";
		try {
			psmt = conn.prepareStatement(sql2);
			psmt.setInt(1, vo.getBoardNumber());		
			rs = psmt.executeQuery();		
		}
		catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, vo.getBoardNumber());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setBoardNumber(rs.getInt("boardnumber"));
				vo.setBoardTitle(rs.getString("boardtitle"));
				vo.setBoardWriter(rs.getString("boardwriter"));
				vo.setBoardContent(rs.getString("boardcontent"));
				vo.setBoardDate(rs.getDate("boarddate"));
				vo.setBoardHit(rs.getInt("boardhit"));
				vo.setBoardValue(rs.getString("boardvalue"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return vo;
	}

	public int boardUpdate(BoardVo vo) {
		int n = 0;
		String sql = "UPDATE BOARD SET BOARDTITLE=?, BOARDCONTENT=?, boarddate=sysdate WHERE BOARDNUMBER=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getBoardTitle());
			psmt.setString(2, vo.getBoardContent());
			psmt.setInt(3, vo.getBoardNumber());
			n = psmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return n;
	}

}
