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

public class MyPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);

		/* 페이징 외 마이페이지 요소들 */

		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		
		MemberVO loginMemberVO = MemberDAO.getInstance().memberInfo(mvo.getEmail());
		//ArrayList<PostVO> list = BoardDAO.getInstance().getMemberPosts(mvo.getEmail());// 현재 로그인 중인 회원의 email로 //

		/* 페이징용 */
		
		int totalPostCount = BoardDAO.getInstance().getMemberTotalPostCount(mvo.getEmail());
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		
		
		System.out.println("total post count: " + totalPostCount);
		System.out.println("page no:" + pageNo);

		if (pageNo == null) {
			// 현재 페이지가 1page로 할당되어 있음
			pagingBean = new PagingBean(totalPostCount);
		} else {
			// client에서 보낸 page번호로 할당한다
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}

		ArrayList<PostVO> list = BoardDAO.getInstance().getMemberPostingList(pagingBean, mvo.getEmail());

		// 게시물 리스트 정보
		session.setAttribute("postList", list);

		// 페이징 정보
		session.setAttribute("pagingBean", pagingBean);

		/* 페이징 외 */
		RankVO rank = MemberDAO.getInstance().getMemberRank(mvo.getEmail());
		session.setAttribute("rank", rank);// 민주 - 랭킹용
		session.setAttribute("mvo", loginMemberVO);// 현재 로그인한 회원의 email, nickname, github 정보를 가져온다
		//session.setAttribute("list", list);// 현재 로그인한 회원의 post lists들을 불러온다
		
		request.setAttribute("url", "test-mypage.jsp");
		return "layout.jsp";
	}

}