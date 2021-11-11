package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.MemberDAO;
import org.kosta.moco.model.MemberVO;

public class ChangeThemaController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String theme = request.getParameter("theme");
		request.getSession().setAttribute("theme", theme);
		// MemberDAO와 연동해서 기본 DB에서도 바꿔준다.
		MemberVO vo = (MemberVO) request.getSession().getAttribute("mvo");
		MemberDAO.getInstance().changeThema(theme, vo.getEmail());
		return "MyPageController.do";
	}
}
