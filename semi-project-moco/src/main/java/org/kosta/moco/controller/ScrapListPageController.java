package org.kosta.moco.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.moco.model.BoardDAO;
import org.kosta.moco.model.MemberDAO;
import org.kosta.moco.model.MemberVO;
import org.kosta.moco.model.PagingBean;
import org.kosta.moco.model.PostVO;
import org.kosta.moco.model.RankVO;

public class ScrapListPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/* 페이징 외 마이페이지 요소들 */

		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo"); // mvo.getEmail : 현재 로그인한 회원의 이메일
		
		HttpSession session = request.getSession(false);

		/* 페이징용 */
		
		int totalPostScrapCount = BoardDAO.getInstance().getTotalScrapPostCount(mvo.getEmail());
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		
		
		System.out.println("total post count: " + totalPostScrapCount);
		System.out.println("page no:" + pageNo);

		if (pageNo == null) {
			// 현재 페이지가 1page로 할당되어 있음
			pagingBean = new PagingBean(totalPostScrapCount);
		} else {
			// client에서 보낸 page번호로 할당한다
			pagingBean = new PagingBean(totalPostScrapCount, Integer.parseInt(pageNo));
		}

		ArrayList<PostVO> scrapList = BoardDAO.getInstance().getScrapPostList(mvo.getEmail(), pagingBean);

		// 게시물 리스트 정보
		request.setAttribute("scrapList", scrapList);

		// 페이징 정보
		session.setAttribute("pagingBean", pagingBean);

		request.setAttribute("url", "scrap-list.jsp");
		return "layout.jsp";
	}

}
