package org.kosta.moco.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.moco.model.MemberDAO;
import org.kosta.moco.model.MemberVO;
import org.kosta.moco.model.PostVO;
import org.kosta.moco.model.RankVO;

public class MyPageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 로그인 체크
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null) {
			return "redirect:index.jsp";
		}
		
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("mvo");//현재 로그인 중인 회원 정보를 받아온다
		MemberVO loginMemberVO = MemberDAO.getInstance().memberInfo(mvo.getEmail());//현재 로그인 중인 회원의 email로 nickname, github를 알아낸다
		session.setAttribute("loginMemberVO", loginMemberVO);//현재 로그인한 회원의 email, nickname, github 정보를 가져온다(이때 edit-memberinfo.jsp에서 비번 출력을 위해 password도 받아왔다.)
		
		ArrayList<PostVO> list = MemberDAO.getInstance().getMemberPosts(mvo.getEmail());// 현재 로그인 중인 회원의 email로
		RankVO rank = MemberDAO.getInstance().getMemberRank(mvo.getEmail());

		session.setAttribute("rank", rank);// 민주

		session.setAttribute("loginMemberVO", loginMemberVO);// 현재 로그인한 회원의 email, nickname, github 정보를 가져온다
		session.setAttribute("list", list);// 현재 로그인한 회원의 email, nickname, github 정보를 가져온다

		request.setAttribute("url", "mypage.jsp");
		return "layout.jsp";
	}

}