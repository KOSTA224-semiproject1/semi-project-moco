package org.kosta.moco.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.BoardDAO;
import org.kosta.moco.model.LanguageVO;
import org.kosta.moco.model.PostVO;

public class EditPostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 요청방식 post 확인 부분
		if(request.getMethod().equals("POST") == false)
			throw new ServletException("게시글 수정은 post 방식만 허용");
		
		// 게시글 수정을 위한 데이터 할당 부분
		String postNo = request.getParameter("postNo");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String codeContent = request.getParameter("codeContent");
		
		PostVO postVO = new PostVO();
		postVO.setPost_no(Integer.parseInt(postNo));
		postVO.setPost_title(title);
		postVO.setPost_content(content);
		postVO.setPost_code(codeContent);
		
		BoardDAO.getInstance().editPostByPostNo(postVO);
		
		int languageCode = Integer.parseInt(request.getParameter("languageCode"));
			
		return "redirect:ListPageController.do?languageCode=" + languageCode;
	}
	
}
