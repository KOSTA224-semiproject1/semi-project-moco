package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WritePostPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String languageCode = request.getParameter("languageCode");
		request.setAttribute("languageCode", languageCode);
		
		request.setAttribute("url", "board/write.jsp");
		return "layout.jsp";
	}

}
