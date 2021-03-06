package org.kosta.moco.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.BoardDAO;

public class EditPostPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String languageCode = request.getParameter("languageCode");
		request.setAttribute("languageCode", languageCode);
		
		// 요청방식 post 확인 부분
		if(request.getMethod().equals("POST") == false)
			throw new ServletException("게시글 수정는 post 방식만 허용");
		
		request.setAttribute("pvo", BoardDAO.getInstance().getPostingByPostNo(request.getParameter("postNo")));
		String postNo = request.getParameter("postNo");
		System.out.println(postNo);
		request.setAttribute("url", "board/edit.jsp");
		return "layout.jsp";
	}
	
}
