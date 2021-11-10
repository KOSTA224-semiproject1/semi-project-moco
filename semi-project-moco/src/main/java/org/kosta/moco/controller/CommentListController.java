package org.kosta.moco.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.CommentDAO;
import org.kosta.moco.model.CommentVO;

public class CommentListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String postNo = request.getParameter("post_no");
		ArrayList<CommentVO> list = CommentDAO.getInstance().getCommentListByNo(postNo);
		request.setAttribute("commentList", list);
		request.setAttribute("url", "comment/list.jsp");
		System.out.println(list);
		return "layout.jsp";
	}
}