package org.kosta.moco.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;


public class BoardDAO {
	private static BoardDAO instance=new BoardDAO();
	private DataSource dataSource;
	private BoardDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static BoardDAO getInstance() {
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
	
	public ArrayList<PostVO> getPostingList(PagingBean pagingBean, int languageCode) throws SQLException {
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select v.rnum, v.post_no, v.post_title, to_char(v.post_regdate, 'yyyy-mm-dd') as post_regdate, m.nickname, v.hits, v.language_code, v.language ");
			sql.append("from ( ");
			sql.append("select row_number() over(order by b.post_regdate desc) as rnum, b.post_no, b.post_title, b.post_regdate, b.hits, b.email, b.language_code, l.language ");
			sql.append("from moco_qna_board b, moco_service_language l ");
			sql.append("where b.language_code = l.language_code and l.language_code = ? ");
			sql.append(") v, moco_member m ");
			sql.append("where v.email = m.email and v.rnum between ? and ? ");
			sql.append("order by v.post_regdate desc");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, languageCode);
			pstmt.setInt(2, pagingBean.getStartRowNumber());
			pstmt.setInt(3, pagingBean.getEndRowNumber());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PostVO pvo = new PostVO();
				pvo.setPost_no(rs.getInt(2));
				pvo.setPost_title(rs.getString(3));
				pvo.setPost_regdate(rs.getString(4));
				pvo.setHits(rs.getInt(6));
				
				MemberVO mvo = new MemberVO();
				mvo.setNickname(rs.getString(5));
				pvo.setMvo(mvo);
				
				LanguageVO lvo = new LanguageVO();
				lvo.setLanguage_code(rs.getInt(7));
				lvo.setLanguage(rs.getString(8));
				pvo.setLvo(lvo);
				
				list.add(pvo);
			}
			
 		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return list;
	}
	
	
	
	public int getTotalPostCount(int languageCode) throws SQLException {
		int totalPostCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from moco_qna_board where language_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, languageCode);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalPostCount = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return totalPostCount;
	}
	
}
