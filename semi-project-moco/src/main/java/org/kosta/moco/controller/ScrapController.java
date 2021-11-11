package org.kosta.moco.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.BoardDAO;
import org.kosta.moco.model.MemberVO;
import org.kosta.moco.model.PostVO;

public class ScrapController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String email = request.getParameter("email");
		
		boolean result = BoardDAO.getInstance().checkScrap(postNo, email);
		
		if(result) { // 중복 스크랩이면,
			return "PostDetailPageController.do"; // 스크랩 메소드 실행x
		}
		BoardDAO.getInstance().scrap(email, postNo);
		System.out.println("스크랩 완료");
		return "PostDetailPageController.do";
	}

}
