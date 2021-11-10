package org.kosta.moco.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.kosta.moco.model.MemberDAO;
import org.kosta.moco.model.NicknameVO;

/**
 * Servlet implementation class NicknameCheckServlet
 */
@WebServlet("/NicknameCheckServlet")
public class NicknameCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String nickname = request.getParameter("nickname");
		
		boolean result = false;
		try {
			result = MemberDAO.getInstance().nicknameCheck(nickname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		NicknameVO nvo = new NicknameVO(result);
		JSONObject json = new JSONObject(nvo);
		out.print(json.toString());
		out.close();
	}

}
