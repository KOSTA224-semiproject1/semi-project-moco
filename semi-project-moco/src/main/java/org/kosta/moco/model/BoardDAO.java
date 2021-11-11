package org.kosta.moco.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.kosta.moco.model.MemberVO;
import org.kosta.moco.model.PagingBean;
import org.kosta.moco.model.PostVO;

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

	public ArrayList<PostVO> getPostingList(PagingBean pagingBean, int languageCode) throws SQLException {
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select v.rnum, v.post_no, v.post_title, to_char(v.post_regdate, 'yyyy-mm-dd') as post_regdate, m.nickname, v.hits, v.language_code, v.language, v.can_select ");
			sql.append("from ( ");
			sql.append("select row_number() over(order by b.post_regdate desc) as rnum, b.post_no, b.post_title, b.post_regdate, b.hits, b.email, b.language_code, l.language, b.can_select ");
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

			while (rs.next()) {
				PostVO pvo = new PostVO();
				pvo.setPost_no(rs.getInt(2));
				pvo.setPost_title(rs.getString(3));
				pvo.setPost_regdate(rs.getString(4));
				pvo.setHits(rs.getInt(6));
				pvo.setCan_select(rs.getString(9));
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

	/* 마이페이지 페이징용 */
	public ArrayList<PostVO> getMemberPostingList(PagingBean pagingBean, String email) throws SQLException {
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select v.rnum, v.post_no, v.post_title, to_char(v.post_regdate, 'yyyy-mm-dd') ");
			sql.append("as post_regdate, v.hits, v.language, v.language_code ");
			sql.append("from ( ");
			sql.append("select row_number() over(order by b.post_regdate desc) as rnum, b.post_no, b.post_title, ");
			sql.append("b.post_regdate, b.hits, b.email, l.language, b.language_code ");
			sql.append("from moco_qna_board b, moco_service_language l ");
			sql.append("where b.language_code = l.language_code  and b.email= ? ");
			sql.append(") v, moco_member m ");
			sql.append("where v.rnum between ? and ? ");
			sql.append("and  v.email=m.email ");
			sql.append("order by v.post_regdate desc ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			pstmt.setInt(2, pagingBean.getStartRowNumber());
			pstmt.setInt(3, pagingBean.getEndRowNumber());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostVO pvo = new PostVO();
				pvo.setPost_no(rs.getInt(2));
				pvo.setPost_title(rs.getString(3));
				pvo.setPost_regdate(rs.getString(4));
				pvo.setHits(rs.getInt(5));

				MemberVO mvo = new MemberVO();
				pvo.setMvo(mvo);

				LanguageVO lvo = new LanguageVO();
				lvo.setLanguage(rs.getString(6));
				lvo.setLanguage_code(rs.getInt(7));
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

			if (rs.next()) {
				totalPostCount = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}

		return totalPostCount;
	}

	/* 마이페이지 포스팅용 */

	public int getMemberTotalPostCount(String email) throws SQLException {
		int totalPostCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from moco_qna_board where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalPostCount = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}

		return totalPostCount;
	}

	public void updateHits(String postNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			String sql = "update moco_qna_board set hits = hits+1 where post_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, postNo);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}

	}

	public PostVO getPostingByPostNo(String postNo) throws SQLException {
		PostVO pvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select b.post_no, b.post_title, b.post_content, b.post_code, to_char(b.post_regdate, 'yyyy-mm-dd') as post_regdate, b.hits, m.nickname, m.email, b.language_code, b.can_select ");
			sql.append("from moco_qna_board b, moco_member m ");
			sql.append("where b.email = m.email and b.post_no = ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(postNo));
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pvo = new PostVO();
				pvo.setPost_no(rs.getInt(1));
				pvo.setPost_title(rs.getString(2));
				pvo.setPost_content(rs.getString(3));
				pvo.setPost_code(rs.getString(4));
				pvo.setPost_regdate(rs.getString(5));
				pvo.setHits(rs.getInt(6));

				MemberVO mvo = new MemberVO();
				mvo.setNickname(rs.getString(7));
				mvo.setEmail(rs.getString(8));
				pvo.setMvo(mvo);

				LanguageVO lvo = new LanguageVO();
				lvo.setLanguage_code(rs.getInt(9));
				pvo.setLvo(lvo);
				pvo.setCan_select(rs.getString(10));
			}
		} finally {
			closeAll(pstmt, con);
		}

		return pvo;
	}

	/**
	 * 채택하기 기능을 사용한 게시물은 더 이상 채택을 해서는 안된다. 따라서 DB에 반영을 해주어야 한다.
	 * 
	 * @param pno : 해당 게시물 번호
	 * @throws SQLException
	 */
	public void DoNotSelectByNo(String pno) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "update moco_qna_board set can_select= ? where post_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "Y");
			pstmt.setString(2, pno);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	// 게시글 검색 메소드
	public ArrayList<PostVO> getSearchPostList(String field, String query, PagingBean pagingBean, int languageCode)
			throws SQLException {
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
			sql.append("where v.email = m.email ");
			sql.append("and REPLACE(" + field + ", ' ', '') like ? "); // 띄어쓰기 상관없이 검색 가능
			sql.append("and v.rnum between ? and ? ");
			sql.append("order by v.post_regdate desc");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, languageCode);
			pstmt.setString(2, "%" + query + "%");
			pstmt.setInt(3, pagingBean.getStartRowNumber());
			pstmt.setInt(4, pagingBean.getEndRowNumber());
			rs = pstmt.executeQuery();

			while (rs.next()) {
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

	// 게시글 스크랩 메소드
	public void scrap(String email, int postNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "insert into moco_scrap values(?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, postNo);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	// 게시글 스크랩 리스트 반환 메소드
	public ArrayList<PostVO> getScrapPostList(String email, PagingBean pagingBean) throws SQLException {
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder("");
			sql.append("select v.rnum, v.post_no, b.post_title, to_char(b.post_regdate, 'yyyy-mm-dd') as post_regdate, v.nickname, b.hits ");
			sql.append("from ( ");
			sql.append("select row_number() over(order by s.scrap_date desc) as rnum, m.email, m.nickname, s.post_no, s.scrap_date ");
			sql.append("from moco_member m, moco_scrap s ");
			sql.append("where m.email=s.email and m.email=? ");
			sql.append(") v, moco_qna_board b ");
			sql.append("where v.post_no=b.post_no ");
			sql.append("and v.rnum between ? and ?");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			pstmt.setInt(2, pagingBean.getStartRowNumber());
			pstmt.setInt(3, pagingBean.getEndRowNumber());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostVO pvo = new PostVO();
				pvo.setPost_no(rs.getInt(2));
				pvo.setPost_title(rs.getString(3));
				pvo.setPost_regdate(rs.getString(4));
				pvo.setHits(rs.getInt(6));
				MemberVO mvo = new MemberVO();
				mvo.setNickname(rs.getString(5));
				pvo.setMvo(mvo);
				list.add(pvo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	// 이미 스크랩 리스트에 추가된 게시물인지 확인하는 메소드
	public boolean checkScrap(int postNo, String email) throws SQLException {
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from moco_scrap where post_no=? and email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) == 1) {
				result = true;
			}
			System.out.println("result : " + result); // 확인용 print
		} finally {
			closeAll(rs, pstmt, con);
		}
		return result;
	}
	
	public int getTotalScrapPostCount(String email) throws SQLException {
		int totalScrapPostCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from moco_scrap where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalScrapPostCount = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}

		return totalScrapPostCount;
	}

}