package org.kosta.moco.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.moco.model.BoardDAO;
import org.kosta.moco.model.LanguageVO;
import org.kosta.moco.model.MemberVO;
import org.kosta.moco.model.PostVO;

public class WritePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		
		// 요청방식 post 확인 부분
		if(request.getMethod().equals("POST") == false)
			throw new ServletException("게시글 등록은 post 방식만 허용");
		
		// 게시글 등록을 위한 데이터 할당 부분
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String codeContent = request.getParameter("codeContent");
		System.out.println(request.getParameter("languageCode"));
		int languageCode = Integer.parseInt(request.getParameter("languageCode"));
		
		PostVO postVO = new PostVO();
		postVO.setPost_title(title);
		postVO.setPost_content(content);
		postVO.setPost_code(codeContent);
		postVO.setMvo((MemberVO)session.getAttribute("mvo"));
		LanguageVO lvo = new LanguageVO();
		//lvo.setLanguage(request.getAttribute("language"));
		lvo.setLanguage_code(languageCode);
		postVO.setLvo(lvo); 
		
		BoardDAO.getInstance().posting(postVO);
		System.out.println(title + " 게시글 등록 완료");
		
		return "redirect:ListPageController.do?languageCode=" + languageCode; //글 등록 후 게시글 리스트를 보여줌
	}

}
