package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.MemberDAO;
import org.kosta.moco.model.MemberVO;

public class RegisterController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String github = request.getParameter("github");
		github = "www.github.com/" + github;
		
		MemberVO mvo = new MemberVO(email, password, nickname, github);
		MemberDAO.getInstance().registerMember(mvo);
		
		request.setAttribute("userEmail", email);
		
		return "SendEmailController.do";
	}

}
