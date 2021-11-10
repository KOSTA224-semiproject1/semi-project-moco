package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.CommentDAO;
import org.kosta.moco.model.MemberVO;
import org.kosta.moco.model.PostVO;


public class WriteCommentController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 삭제 후 해당 게시물 페이지로 이동하기 위한 셋업
		String postNo = request.getParameter("postNo");
		String languageCode = request.getParameter("languageCode");
		
		String comment_content = request.getParameter("comment_content");
		MemberVO vo = (MemberVO) request.getSession().getAttribute("mvo");
		String email = vo.getEmail();
		CommentDAO.getInstance().writeCommentByNo(comment_content, email, postNo);
		System.out.println("postNo = " + postNo);
		return "PostDetailPageController.do?post_no="+postNo+"&languageCode=" + languageCode;
	}
}