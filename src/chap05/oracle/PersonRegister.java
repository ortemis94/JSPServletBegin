package chap05.oracle;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/personRegister.do")
public class PersonRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	InterPersonDAO dao = new PersonDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getMethod(); // GET 또는 POST 중 어떤 방식으로 들어왔는지 받아오는 것.
		
		if (method.equals("GET")) { 
			// GET 방식으로 URL /personRegister.do을 호출한 경우라면 form 태그만 띄워주도록 한다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/chap05_oracle/personRegister.jsp"); // personRegister.jsp 페이지로 보내주는 것.
			dispatcher.forward(request, response);
		}else { 
			// POST 방식으로 URL /personRegister.do을 호출한 경우라면 전송되어져 온 데이터를 DB로 보내야 한다.
			//System.out.println("전송되어져 온 데이터를 DB로 보내야 한다.");
		
			String name = request.getParameter("name");
			String school = request.getParameter("school");
			String color = request.getParameter("color");
			String[] foodArr = request.getParameterValues("food");
		
			PersonDTO psdto = new PersonDTO();
			psdto.setName(name);
			psdto.setSchool(school);
			psdto.setColor(color);
			psdto.setFood(foodArr);
			
			String pathName = "";
			
			try {
				int n = dao.personRegister(psdto);
				
				if (n == 1) {
					pathName = "/WEB-INF/chap05_oracle/personRegister_ok.jsp";
				}else {
					pathName = "/WEB-INF/chap05_oracle/personRegister_fail.jsp";
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				pathName = "/WEB-INF/chap05_oracle/sqlerror.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(pathName); 
			dispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
