package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.MemberDAO;

public class EmailCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		boolean result = MemberDAO.getInstance().emailCheck(email);
		if(result)
			return "email-check-fail.jsp";
		else
			return "email-check-ok.jsp";
	}

}
