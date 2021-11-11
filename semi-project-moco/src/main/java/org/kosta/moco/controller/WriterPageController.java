package org.kosta.moco.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.BoardDAO;
import org.kosta.moco.model.MemberDAO;
import org.kosta.moco.model.MemberVO;
import org.kosta.moco.model.PagingBean;
import org.kosta.moco.model.PostVO;
import org.kosta.moco.model.RankVO;

public class WriterPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String nickname=request.getParameter("nickname");
		String email=MemberDAO.getInstance().getMemberEmail(nickname);
		System.out.println(email);
		MemberVO memberVO = MemberDAO.getInstance().memberInfo(email);
		System.out.println(memberVO);
		

		/* 페이징 외 작성자페이지 요소들 */

		//ArrayList<PostVO> list = BoardDAO.getInstance().getMemberPosts(mvo.getEmail());// 현재 로그인 중인 회원의 email로 //

		/* 페이징용 */
		
		int totalPostCount = BoardDAO.getInstance().getMemberTotalPostCount(email);
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		

		if (pageNo == null) {
			// 현재 페이지가 1page로 할당되어 있음
			pagingBean = new PagingBean(totalPostCount);
		} else {
			// client에서 보낸 page번호로 할당한다
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}

		ArrayList<PostVO> list = BoardDAO.getInstance().getMemberPostingList(pagingBean, email);

		// 게시물 리스트 정보
		request.setAttribute("postList", list);

		// 페이징 정보
		request.setAttribute("pagingBean", pagingBean);

		/* 페이징 외 */
		RankVO rank = MemberDAO.getInstance().getMemberRank(email);
		request.setAttribute("rank", rank);// 민주 - 랭킹용
		request.setAttribute("memberVO", memberVO);
		request.setAttribute("url", "writerpage.jsp");
		return "layout.jsp";
	}

}