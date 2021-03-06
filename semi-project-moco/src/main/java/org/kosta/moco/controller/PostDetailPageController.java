package org.kosta.moco.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.BoardDAO;
import org.kosta.moco.model.CommentDAO;
import org.kosta.moco.model.CommentVO;
import org.kosta.moco.model.PostVO;

public class PostDetailPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String languageCode = request.getParameter("languageCode");
		request.setAttribute("languageCode", languageCode);
		String postNo = request.getParameter("postNo");
		
		System.out.println("<PostDetailPageController>: postNo = " + postNo + ", languageCode = " + languageCode);
			
		@SuppressWarnings("unchecked")
		ArrayList<String> myboardNo = (ArrayList<String>)request.getSession(false).getAttribute("myboardNo");
		if(myboardNo.contains(postNo) == false) {
			myboardNo.add(postNo);
			// 조회수 증가
			BoardDAO.getInstance().updateHits(postNo);
		}

		// 상세 게시물 조회
		PostVO pvo = BoardDAO.getInstance().getPostingByPostNo(postNo);
		ArrayList<CommentVO> list = CommentDAO.getInstance().getCommentListByNo(postNo);
		request.setAttribute("commentList", list);
		request.setAttribute("pvo", pvo);
		request.setAttribute("url", "board/post-detail.jsp");
		request.setAttribute("url2", "comment/list.jsp");
		return "layout.jsp";
	}

}
