package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.BoardDAO;

public class DeleteScrapController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 삭제 후 해당 게시물 페이지로 이동하기 위한 셋업

		// 해당 댓글 삭제하기 위한 작업
		String[] checknum = request.getParameterValues("RowCheck");
		for (int i = 0; i < checknum.length; i++) {
			BoardDAO.getInstance().deleteScrap(checknum[i]);
		}

		return "redirect:ScrapListPageController.do";
	}

}
