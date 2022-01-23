package org.kosta.moco.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class LanguageDAO {
	private static LanguageDAO instance = new LanguageDAO();
	private DataSource dataSource;
	private LanguageDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}
	public static LanguageDAO getInstance() {
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
	public String getLanguageName(int languageCode) throws SQLException {
		String languageName = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String sql = "select language from moco_service_language where language_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, languageCode);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				languageName = rs.getString(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		
		return languageName;
	}
}
