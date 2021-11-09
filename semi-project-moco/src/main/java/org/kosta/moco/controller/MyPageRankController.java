package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.MemberDAO;
import org.kosta.moco.model.RankVO;

public class MyPageRankController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email=request.getParameter("email");
		RankVO rankVO=MemberDAO.getInstance().getMemberRank(email);
		request.setAttribute("url", "mypage-board/rank.jsp");

		return null;
	}

}
