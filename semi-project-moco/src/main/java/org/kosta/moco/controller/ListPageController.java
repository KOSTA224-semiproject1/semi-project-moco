package org.kosta.moco.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.BoardDAO;
import org.kosta.moco.model.LanguageDAO;
import org.kosta.moco.model.PagingBean;
import org.kosta.moco.model.PostVO;

public class ListPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 언어별 게시판 클릭시 languageCode를 파라미터로 보내주는 코드 추가해야함
		int languageCode = Integer.parseInt(request.getParameter("languageCode"));
		request.setAttribute("language", LanguageDAO.getInstance().getLanguageName(languageCode));
		request.setAttribute("languageCode", languageCode);
		int totalPostCount = BoardDAO.getInstance().getTotalPostCount(languageCode);
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		
		System.out.println("language code: " + languageCode);
		System.out.println("total post count: " + totalPostCount);
		System.out.println("page no:" + pageNo);
		
		if(pageNo == null) {
			// 현재 페이지가 1page로 할당되어 있음
			pagingBean = new PagingBean(totalPostCount);
		}
		else {
			// client에서 보낸 page번호로 할당한다
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		
		ArrayList<PostVO> list = BoardDAO.getInstance().getPostingList(pagingBean, languageCode);
		
		// 게시물 리스트 정보
		request.setAttribute("postList", list);
		
		// 페이징 정보
		request.setAttribute("pagingBean", pagingBean);
		
		// template layout 페이지를 이용해 리스트 화면을 제공
		request.setAttribute("url", "board/list.jsp");
		return "layout.jsp";
	}

}
