package chap03;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerPerson.do")
public class RegisterPerson extends HttpServlet { // GET 방식으로 들어왔을 때
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getMethod(); // GET 또는 POST
		
		if (method.equalsIgnoreCase("post")) { // POST 방식이라면
			
			String name = request.getParameter("name");
			String school = request.getParameter("school");
			String color = request.getParameter("color");
			
			String[] arrFood = request.getParameterValues("food"); // 배열로 넘어오는 파라미터는 .getParameterValues("")로 받아온다. 
			String foodes = String.join(", ", arrFood); // 배열의 값들을 , 를 구분자로 하여 한 문자열로 만든다.
			
			// 저장소에 저장시킨다.
			/*
			request.setAttribute("name", name); 
			request.setAttribute("school", school);
			request.setAttribute("color", color); 
			request.setAttribute("foodes", foodes);
			*/
			Map<String, String> paraMap = new HashMap<>();
			
			paraMap.put("name", name);
			paraMap.put("school", school);
			paraMap.put("color", color);
			paraMap.put("foodes", foodes);
			
			request.setAttribute("paraMap", paraMap);
			
		 // MVC 패턴 ==> Model단(데이터베이스와 연결하는 DAO), View단(결과물을 보여주는 JSP), Controller단(Servlet).
			RequestDispatcher dispatcher = request.getRequestDispatcher("/chap03_StandardAction/04forwardRegisterView.jsp");
			dispatcher.forward(request, response);
		}else { // GET 방식이라면
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error/error.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // POST 방식으로 들어왔을 때
		
		doGet(request, response); // doGet함수를 호출함.
	}

}
