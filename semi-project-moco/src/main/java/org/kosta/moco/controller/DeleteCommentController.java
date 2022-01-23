package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.CommentDAO;

public class DeleteCommentController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 삭제 후 해당 게시물 페이지로 이동하기 위한 셋업
		String postNo = request.getParameter("postNo");
		String languageCode = request.getParameter("languageCode");
		// 해당 댓글 삭제하기 위한 작업
		String comment_no = request.getParameter("comment_no");
		CommentDAO.getInstance().deleteCommentByNo(comment_no);
		return "PostDetailPageController.do?post_no="+postNo+"&languageCode=" + languageCode;
	}
}