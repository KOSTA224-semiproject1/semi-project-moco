package org.kosta.moco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginController implements Controller {
	
	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//post 요청방식만 로그인 처리한다 
		request.setAttribute("url", "login.jsp");
		return "layout.jsp";
		}		
	}


