package chap05.oracle;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PersonSelect
 */
@WebServlet("/personSelect.do")
public class PersonSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// tbl_person_interest 테이블에 저장되어진 행(데이터)을 읽어다가 (select)웹 페이지에 보여주어야 한다.
		InterPersonDAO dao = new PersonDAO();
		
		String path = "";
		
		try {
			List<PersonDTO> personList = dao.selectALL();
			request.setAttribute("personList", personList);
			
			path = "/WEB-INF/chap05_oracle/personSelectAll.jsp";
		} catch (SQLException e) {
			e.printStackTrace();

			path = "/WEB-INF/chap05_oracle/sqlerror.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
