package chap02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/getpostMethod_5.do")
public class GetPostMethod_5 extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   //   response.getWriter().append("Served at: ").append(request.getContextPath());
   /*
       response.getWriter()     ==> 웹브라우저상에 기술할 수 있는 객체를 얻어오는 것.
       .append("Served at: ")   ==> print와 비슷함
       request.getContextPath() ==> context명을 읽어오는 것.   /JSPServletBegin
       웹브라우저상에 Served at: /JSPServletBegin 를 찍어줌
   */
      
   
      
      /*
           post 방식으로 넘어온 데이터중 영어는 글자가 안깨지지만,
           한글은 글자모양이 깨져나온다.
           그래서  post 방식에서 넘어온 한글 데이터가 글자가 안깨지게 하려면 
           아래처럼 request.setCharacterEncoding("UTF-8"); 을 해야 한다.
           주의할 것은 request.getParameter("변수명"); 보다 먼저 기술을 해주어야 한다는 것이다.      
       */
      //request.setCharacterEncoding("UTF-8");
      
      // HttpServletRequest request 객체는 넘어온 데이터를 조작해서 결과물을 나타내고자 할때 쓰인다.
      String name = request.getParameter("name"); // request.getParameter(name) --> name은 colmn명(태그의 name속성) , 리턴타입은 무조건 String
      String school = request.getParameter("school");
      String color = request.getParameter("color");
      // 이런방식으로는 복수의 값은 받지 못하고 단일값만 받아 올 수 있다.
      
      String[] foodArr = request.getParameterValues("food"); 
      // request.getParameterValues(name); -> name의 값을 배열로 받아옴 
      // -> 리턴타입 배열(check박스와 같이 다중 선택되어 값이 여러개로 들어올 수 있을때 사용)
      // 선택자체를 안했을 경우 request.getParameterValues("food");를 통해 들어오는 값은 null이므로 배열자체가 생성이 안됨 
      // 즉, 변수 foodArr의 값은 null인 상태
      
      
      // *** 콘솔에 출력하기 시작 *** //
      System.out.println("name => " + name);      //name => 이순신
      System.out.println("school => " + school);   //school => 고졸
      
      if(color == null) {
         color = "없음";
      }
      System.out.println("color => " + color);   //color => red
      
      if(foodArr != null) {
         for(int i=0; i<foodArr.length; i++) { //foodArr이 null이라면 length를 잴 수 없으므로 nullpointexception이 떨어짐. null.length는 불가능
            System.out.println("foodArr["+i+"] => " + foodArr[i]); //foodArr[0] => 짜짱면 foodArr[1] => 짬뽕 foodArr[2] => 탕수육
         }
      }

      // *** 콘솔에 출력하기 끝 ***//
      
      // *** 웹브라우저에 출력하기 시작 *** //

      // HttpServletResponse response 객체는 넘어온 데이터를 조작해서 결과물을 나타내고자 할때 쓰인다.
       response.setContentType("text/html; charset=UTF-8");
         
       // *** 클라이언트에서 넘어온 method 방식이 get인지 post인지 알아오기 *** //
       String method  = request.getMethod(); // Method가 뭔지 알아오는 방식 -> get 또는 post가 나올것
       
      PrintWriter out = response.getWriter();
            // out 은 웹브라우저에 기술하는 대상체라고 생각하자.
           // PrintWriter객체는 웹브라우저라고 보면된다. (System.out이 모니터이듯이)
             
       out.println("<html>");
       out.println("<head><title>개인 성향 테스트 결과화면</title></head>");
       out.println("<body>");
       out.println("<h2>개인 성향 테스트 결과("+method+")</h2>");
       out.printf("<span style='color: yellow; font-weight: bold;'>%s</span>님의 개인 성향은<br/><br/>", name);
      
       if(!color.equals("없음")) {
          out.printf("학력은 %s이며, %s색을 좋아합니다.<br/><br/>",school,color);
       } else {
          out.printf("학력은 %s이며, 좋아하는 색이 없습니다.<br/><br/>",school);
       }

       // %d ==> decimal 정수
       // %f ==> float   실수
       // %s ==> string  문자열

       String comida = "";
       if(foodArr != null) {
          comida = String.join("," , foodArr) + " 입니다."; //배열의 요소들을 ,로 구분하여 하나의 문자열로 만들어줌
       } else {
          comida = "없습니다.";
       }
       out.println("좋아하는 음식은 "+comida);
      
       out.println("</body>");
       out.println("</html>");
       
      // *** 웹브라우저에 출력하기 끝 *** //
      
      
   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}