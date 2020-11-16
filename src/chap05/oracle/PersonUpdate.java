package chap05.oracle;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PersonUpdate
 */
@WebServlet("/personUpdate.do")
public class PersonUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		InterPersonDAO dao = new PersonDAO();
	
		String seq = request.getParameter("seq");
		
		String path = "";

		PersonDTO psdto = null;
		
		// 등록할 때와 같은 페이지에서 해당 seq를 가진 사람의 정보가 표시되어 있어야 한다.
		if (request.getMethod().equals("GET")) { // 처음 수정하기로 들어왔을 때. ("GET" 요청)
			try {
				psdto = dao.selectOne(seq);
				request.setAttribute("psdto", psdto);
				
				path = "/WEB-INF/chap05_oracle/personUpdate.jsp";
			} catch (SQLException e) {
				e.printStackTrace();
				path = "/WEB-INF/chap05_oracle/sqlerror.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/chap05_oracle/personUpdate.jsp"); // personRegister.jsp 페이지로 보내주는 것.
			dispatcher.forward(request, response);

		}else { // 두번째 수정하기로 들어왔을 때. ("POST" 요청)
		
			String name = request.getParameter("name");
			String school = request.getParameter("school");
			String color = request.getParameter("color");
			String[] foodArr = request.getParameterValues("food");
			
			
			psdto = new PersonDTO(); 
			
			psdto.setSeq(Integer.parseInt(seq));
			psdto.setName(name);
			psdto.setSchool(school);
			psdto.setColor(color);
			psdto.setFood(foodArr);
			
			try {
				int n = dao.personUpdate(psdto);
			 /* request.setAttribute("psdto", psdto); */
				if (n == 1) {
				 /* path = "/WEB-INF/chap05_oracle/personDetail.jsp"; */ // 정보수정이 완료되면 상세페이지로 가기
				//	path = "/WEB-INF/chap05_oracle/personUpdate_ok.jsp"; // 정보수정이 완료되면 완료페이지로 가기
				//	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				//	dispatcher.forward(request, response);
					
					response.sendRedirect("personSelect.do"); // sendRedirect는 상대경로로 작성.
				//	response.sendRedirect("이동해야할 URL주소"); ==> 이동해야할 URL주소로 페이지 이동만 일어난다.
				}else {
					path = "/WEB-INF/chap05_oracle/personUpdate_fail.jsp";

					RequestDispatcher dispatcher = request.getRequestDispatcher(path);
					dispatcher.forward(request, response); // forward는 브라우저에 URL은 바뀌지 않고 내용물이 요청하는대로 바뀌는 것. 
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				path = "/WEB-INF/chap05_oracle/sqlerror.jsp";
	
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
			}
			
		}// end of if (request.getMethod().equals("GET")) {} else{}-------------------
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
