package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.moco.model.MailService;
import org.kosta.moco.model.MemberDAO;
import org.kosta.moco.model.MemberVO;

public class SendEmailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userEmail = (String) request.getAttribute("userEmail");
		MemberVO mvo = MemberDAO.getInstance().memberInfo(userEmail);
		String userNickname = mvo.getNickname();
		
		System.out.println(userEmail);
		System.out.println(userNickname);
		
		String mailTitle = "MOCO 회원가입을 축하합니다!";
		String mailContent = "";
		mailContent += "<h1 style='font-weight:900;'>WELCOME&nbsp;MOCO!</h1><br>";
		mailContent += "<p style='font-weight:bold; font-size: 18px;'>" + userNickname + "&nbsp;님,</p><br>";
		mailContent += "<p>MOCO에 오신것을 환영합니다!</p><br>";
		mailContent += "<p>코딩을 하다가 모르는것을 만난다면 MOCO를 이용해보세요!</p><br>";
		
		MailService ms = new MailService();
		ms.sendWelcomeMail(userEmail, mailTitle, mailContent);
		
		System.out.println("welcom email 전송 성공");
		
		return "redirect:MainPageController.do";
	}

}
