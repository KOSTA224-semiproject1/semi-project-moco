package org.kosta.moco.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.BoardDAO;
import org.kosta.moco.model.LanguageDAO;
import org.kosta.moco.model.PagingBean;
import org.kosta.moco.model.PostVO;

public class SearchPostListPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int languageCode = Integer.parseInt(request.getParameter("languageCode"));
		request.setAttribute("language", LanguageDAO.getInstance().getLanguageName(languageCode));
		request.setAttribute("languageCode", languageCode);
		
		int totalPostCount = BoardDAO.getInstance().getTotalPostCount(languageCode);
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean = null;
	
		if(pageNo == null) {
			// 현재 페이지가 1page로 할당되어 있음
			pagingBean = new PagingBean(totalPostCount);
		}
		else {
			// client에서 보낸 page번호로 할당한다
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		
		/**
		 * 게시글 검색을 위한 코드
		 */
		String field = request.getParameter("f");
		String query = request.getParameter("q").replaceAll(" ", "");
		
		System.out.println("field : " + field);
		System.out.println("query : " + query);
		if(query == "") {
			return "ListPageController.do?languageCode=" + languageCode;
		}

		ArrayList<PostVO> searchPostList = BoardDAO.getInstance().getSearchPostList(field, query, pagingBean, languageCode);
		
		System.out.println("searchPostList : " + searchPostList);
		
		request.setAttribute("searchPostList", searchPostList);
		
		request.setAttribute("pagingBean", pagingBean);
		
		request.setAttribute("url", "board/search.jsp");
		
		return "layout.jsp";
	}

}
