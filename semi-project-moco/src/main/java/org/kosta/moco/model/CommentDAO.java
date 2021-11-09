package org.kosta.moco.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;



public class CommentDAO {
	private static CommentDAO instance=new CommentDAO();
	private DataSource dataSource;
	private CommentDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static CommentDAO getInstance() {
		return instance;
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		closeAll(pstmt, con);
	}
	/**
	 *  해당 게시판에 해당하는 댓글 리스트를 가져오는 메서드
	 *  
	 *  게시판 번호에 해당하는 pno를 이용하여 해당 댓글들을 ArrayList에 담아서 가져옴
	 *  댓글들을 가져올 때 has a 관계에 속해있는 PostVO에 대해서는 가져올필요가 없음,
	 *  이는 게시판 상세보기에서 해당 정보가 존재하기 때문에 getAttribute를 이용해서 해당 게시판 정보를 얻을 수 있음.
	 *  하지만 Member에 해당하는 nickname이나 github 주소는 추후 가능성을 위해서 가져옴
	 * 
	 * @param no:  게시판 번호(post_no)
	 * @return ArrayList<CommentVO> : list
	 * @throws SQLException 
	 */
	public ArrayList<CommentVO> getCommentListByNo(int no) throws SQLException {
		ArrayList<CommentVO> list = new ArrayList<>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			/*
			 해당 게시판에 해당하는 댓글 정보와 댓글 작성자의 정보를 가져옴.
			 select comment_no, comment_content, comment_regdate, c.email, m.nickname, m.github
			 from moco_comment c, moco_member m where c.email=m.email and post_no=1 
			 order by comment_no asc
			 */
			con=dataSource.getConnection();//dbcp로부터 컨넥션을 빌려온다
			StringBuilder sql=new StringBuilder();
			sql.append("select comment_no, comment_content, to_char(comment_regdate, 'yyyy-mm-dd'), c.email, m.nickname, m.github ");
			sql.append("from moco_comment c, moco_member m where c.email=m.email and post_no=? ");
			sql.append("order by comment_no asc");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setEmail(rs.getString(4));
				mvo.setNickname(rs.getString(5));
				mvo.setGithub(rs.getString(6));
				CommentVO cvo = new CommentVO(rs.getInt(1), rs.getString(2), rs.getString(3), mvo);
				list.add(cvo);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	/**
	 * 댓글을 삭제하는 기능
	 * 해당 댓글의 seq. NO 를 통해서 댓글을 삭제하는 기능
	 * 
	 * @param no : DB에서 자동 발급되는 seq 번호
	 * @throws SQLException 
	 */
	public void deleteCommentBycno(int no) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			String sql="delete from moco_comment where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
}