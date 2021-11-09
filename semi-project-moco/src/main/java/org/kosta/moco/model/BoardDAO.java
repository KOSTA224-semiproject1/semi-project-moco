package org.kosta.moco.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	private DataSource dataSource;

	private BoardDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static BoardDAO getInstance() {
		return instance;
	}

	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(pstmt, con);
	}
	
	// 게시글 등록 메소드
	public void posting(PostVO postVO) throws SQLException { 
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into moco_qna_board(post_no, post_title, post_content, post_code, post_regdate, email, language_code) ");
			sql.append("values(moco_qna_board_seq.nextval, ?, ?, ?, sysdate, ?, ?)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, postVO.getPost_title());
			pstmt.setString(2, postVO.getPost_content());
			pstmt.setString(3, postVO.getPost_code());
			pstmt.setString(4, postVO.getMvo().getEmail());
			pstmt.setInt(5, postVO.getLvo().getLanguage_code());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
	
	// 게시글 수정 메소드
	public void editPostByPostNo(PostVO postVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "update moco_qna_board set post_title = ?, post_content = ?, post_code = ? where post_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, postVO.getPost_title());
			pstmt.setString(2, postVO.getPost_content());
			pstmt.setString(3, postVO.getPost_code());
			pstmt.setInt(4, postVO.getPost_no());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
	
	// 게시글 삭제 메소드
	public void deletePostByPostNo(int postNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "delete from moco_qna_board where post_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
	
}
