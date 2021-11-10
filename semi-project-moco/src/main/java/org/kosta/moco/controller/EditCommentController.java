package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.CommentDAO;

public class EditCommentController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// (댓글) 변경 후 해당 게시물 페이지로 이동하기 위한 셋업
		String postNo = request.getParameter("postNo");
		String languageCode = request.getParameter("languageCode");
		
		// 댓글 변경하기 위해 필요한 내용
		String content = request.getParameter("postContent");
		String comment_no = request.getParameter("comment_no");
		// 해당 댓글 삭제하기 위한 작업
		System.out.println("comment_no = " + comment_no + ", content = " + content);
		CommentDAO.getInstance().updateCommentByNo(comment_no, content);
		return "PostDetailPageController.do?post_no="+postNo+"&languageCode=" + languageCode;
	}
}
