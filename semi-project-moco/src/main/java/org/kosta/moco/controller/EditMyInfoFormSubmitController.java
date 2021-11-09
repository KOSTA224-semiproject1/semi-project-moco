package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.moco.model.MemberDAO;
import org.kosta.moco.model.MemberVO;

public class EditMyInfoFormSubmitController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//로그인 체크
		HttpSession session = request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			return "redirect:layout.jsp";
		}
		
		//사용자가 입력한 수정값을 받아와서 MemberVO 타입의 Emov를 생성해주고. 
		String email = request.getParameter("email");
		String nickname=request.getParameter("nickname");
		String github=request.getParameter("github");
		String password=request.getParameter("password");
		MemberVO Emov = new MemberVO(email, password, nickname, github);
		
		//사용자가 입력한 수정값을 dao를 통해 db에 update 시켜준다.
		MemberDAO.getInstance().updateMember(Emov);
		MemberVO loginMemberVO = MemberDAO.getInstance().memberInfo(email);
		
		//회원정보가 수정된 현재 로그인 중인 회원을 다시 세션에 넣어준다.
		session.setAttribute("loginMemberVO", loginMemberVO);
		
		request.setAttribute("url", "mypage.jsp");
		return "layout.jsp";
	}

}
