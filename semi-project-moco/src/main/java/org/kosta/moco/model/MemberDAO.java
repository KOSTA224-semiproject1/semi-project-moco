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
	
	//마이페이지 회원정보 조회 - 작성자 : 김진아 2021-11-09
	public MemberVO memberInfo(String email) throws SQLException{
		
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=dataSource.getConnection();
			String sql ="select email, password, nickname, github from MOCO_MEMBER where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				memberVO = new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
				
		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return memberVO;
	}
	
	//회원정보수정 - 작성자 : 김진아 2021-11-09
	public void updateMember(MemberVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "update MOCO_MEMBER set password=? , nickname=? , github=? where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getNickname());
			pstmt.setString(3, vo.getGithub()); 
			pstmt.setString(4, vo.getEmail());
			pstmt.executeUpdate();
			
		} finally {
			closeAll(pstmt, con);
		}
	}
	
	/**
	 * 
	 * 게시글에서 작성자가 채택하기 버튼을 누르면 해당 댓글 작성자의 채택수를 1 증가 시키는 메서드
	 * 이때 작성자의 email을 통해서 해당 멤버를 찾고 thumbs = thumbs + 1을 한다. 
	 * 
	 * @param email	: 댓글 작성자의 이메일
	 * @throws SQLException
	 */
	public void selectComment(String email) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "update moco_member set thumbs = thumbs + 1 where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			
		} finally {
			closeAll(pstmt, con);
		}
	}
}