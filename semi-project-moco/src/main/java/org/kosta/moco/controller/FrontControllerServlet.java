package org.kosta.moco.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FrontControllerServlet
 */
@WebServlet("*.do")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * permitAllList: 비로그인 상태에서 접근 가능한 컨트롤러 리스트
	 * 				  이 리스트에 저장된 컨트롤러는 인증 체크를 하지 않는다
	 */
	private ArrayList<String> permitAllList;
	@Override
	public void init() throws ServletException {
		this.permitAllList = new ArrayList<String>();
		permitAllList.add("ListController");
		permitAllList.add("MainPageController");
		permitAllList.add("LoginController");
		permitAllList.add("LoginFormSubmitController");
		permitAllList.add("RegisterController");
		permitAllList.add("EmailCheckController");
		permitAllList.add("RegisterPageController");
		permitAllList.add("ListPageController");
	}
	
	/**
	 * 로그인 인증 여부를 체크하는 메소드
	 */
	public boolean checkLogin(HttpServletRequest request, String command) {
		boolean result = false;
		HttpSession session = request.getSession(false);
		
		if(permitAllList.contains(command) == false && (session == null || session.getAttribute("mvo") == null)) {
			System.out.println("***" + command + " 인증이 필요한 서비스이므로 로그인해야함***");
			result = true;
		}
		
		return result;
	}
	
	protected void doDispatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String uri = request.getRequestURI();
			String command = uri.substring(request.getContextPath().length()+1, uri.length()-3);
			
			// 인증 공통 정책
			if(checkLogin(request, command)) {
				response.sendRedirect("MainPageController.do");
				return;
			}
			
			Controller controller = HandlerMapping.getInstance().create(command);
			String path = controller.execute(request, response);
			
			if(path.startsWith("redirect:")) {
				response.sendRedirect(path.substring(9));
			}
			else {
				request.getRequestDispatcher(path).forward(request, response);
			}
		} catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doDispatch(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doDispatch(request, response);
	}

}
