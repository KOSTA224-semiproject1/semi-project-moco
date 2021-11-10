package org.kosta.moco.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	private DataSource dataSource;

	private MemberDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static MemberDAO getInstance() {
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

	public void registerMember(MemberVO mvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into moco_member(email, password, nickname, github) ");
			sql.append("values(?, ?, ?, ?)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mvo.getEmail());
			pstmt.setString(2, mvo.getPassword());
			pstmt.setString(3, mvo.getNickname());
			pstmt.setString(4, mvo.getGithub());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	public boolean emailCheck(String email) throws SQLException { 
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from moco_member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) == 1)
				result = true;
		} finally {
			closeAll(rs, pstmt, con);
		}
		return result;
	}

	public boolean nicknameCheck(String nickname) throws SQLException {
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from moco_member where nickname = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) == 1)
				result = true;
		} finally {
			closeAll(rs, pstmt, con);
		}
		return result;
	}
	
	public MemberVO login(String email,String password) throws SQLException {
		MemberVO memberVO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="select nickname from moco_member where email=? and password=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				memberVO=new MemberVO(email,password,rs.getString(1));
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return memberVO;
	}
	
	public  ArrayList<PostVO> getMemberPosts(String email) throws SQLException {
		ArrayList<PostVO> list=new ArrayList<PostVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select v.post_no, v.post_title, v.post_regdate, v.hits, l.language ");
			sql.append("from ( ");
			sql.append("select b.post_no, b.post_title, b.post_regdate, b.hits, b.language_code as lang ");
			sql.append("from moco_qna_board b, moco_member m where m.email =? ");
			sql.append(") v, moco_service_language l ");
			sql.append("where v.lang = l.language_code ");
			sql.append("order by v.post_no desc ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				PostVO pvo=new PostVO();
				pvo.setPost_no(rs.getInt("post_no"));
				pvo.setPost_title(rs.getString("post_title"));
				pvo.setPost_regdate(rs.getString("post_regdate"));
				pvo.setHits(rs.getInt("hits"));
				LanguageVO lvo = new LanguageVO();
				lvo.setLanguage(rs.getString("language"));
				pvo.setLvo(lvo);
				list.add(pvo);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	
		
	public RankVO getMemberRank(String email) throws SQLException{
		RankVO rankVO=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select r.grade ");
			sql.append("from moco_member m, moco_rank r ");
			sql.append("where m.thumbs>=r.min_thumbs and m.thumbs<=r.min_thumbs ");
			sql.append("and m.email=?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				rankVO=new RankVO(rs.getString(1));	
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return rankVO;
	}
	
	

	//마이페이지 회원정보 조회 - 작성자 : 김진아 2021-11-08
	   public MemberVO memberInfo(String email) throws SQLException{
	      
	      MemberVO memberVO = null;
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         con=dataSource.getConnection();
	         String sql ="select email, nickname, github from MOCO_MEMBER where email=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, email);
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	            memberVO = new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3));
	         }
	            
	      } finally {
	         closeAll(rs, pstmt, con);
	      }
	      
	      return memberVO;
	   }
	
	
	}
