package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.BoardDAO;
import org.kosta.moco.model.CommentDAO;
import org.kosta.moco.model.MemberDAO;

public class SelectCommentController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 해당 댓글을 채택함.
		// (댓글) 변경 후 해당 게시물 페이지로 이동하기 위한 셋업
		String postNo = request.getParameter("postNo");
		String languageCode = request.getParameter("languageCode");
		String comment_no = request.getParameter("comment_no");
		String email = request.getParameter("email");
		// DB에 반영하는 작업
		BoardDAO.getInstance().DoNotSelectByNo(postNo);
		CommentDAO.getInstance().selectComment(comment_no);
		MemberDAO.getInstance().selectComment(email);
		return "PostDetailPageController.do?post_no="+postNo+"&languageCode=" + languageCode;
	}
}
