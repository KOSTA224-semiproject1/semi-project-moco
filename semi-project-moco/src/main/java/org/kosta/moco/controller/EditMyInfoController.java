package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.moco.model.MemberDAO;
import org.kosta.moco.model.MemberVO;

public class EditMyInfoController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//로그인 체크
		HttpSession session = request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:layout.jsp";
		}
		
		request.setAttribute("url", "test-edit-memberinfo.jsp");
		return "layout.jsp";
	}

}
