package chap05.oracle;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/personDetail.do")
public class PersonDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String seq = request.getParameter("seq");
		
		InterPersonDAO dao = new PersonDAO();

		String path = "";
		
		try {
			PersonDTO psdto = dao.selectOne(seq);
			request.setAttribute("psdto", psdto);
			
			path = "/WEB-INF/chap05_oracle/personDetail.jsp";
		} catch (SQLException e) {
			e.printStackTrace();
			
			path = "/WEB-INF/chap05_oracle/sqlerror.jsp";
		}
		
		
		RequestDispatcher dispatcher =  request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
