package org.kosta.moco.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.BoardDAO;
import org.kosta.moco.model.PostVO;

public class DeletePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 요청방식 post 확인 부분
		if(request.getMethod().equals("POST") == false)
			throw new ServletException("게시글 삭제는 post 방식만 허용");
		
		String postNo = request.getParameter("postNo");
		System.out.println(postNo);
		PostVO pvo = BoardDAO.getInstance().getPostingByPostNo(postNo);
		BoardDAO.getInstance().deletePostByPostNo(Integer.parseInt(postNo));
		System.out.println(pvo);
		int languageCode = pvo.getLvo().getLanguage_code();
		System.out.println(languageCode);
		return "redirect:ListPageController.do?languageCode=" + languageCode; //글 삭제 후 게시글 리스트를 보여줌
	}

}
