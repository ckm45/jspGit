package controller.member;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vo.MemberDTO;

/**
 * Servlet implementation class PageController
 */
@WebServlet("*.next")
public class PageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    System.out.println("actionDo");
        System.out.println(session.getId());
        String viewPage = null;
        String uri = request.getRequestURI();
        System.out.println("uri : " + uri);
        
        String conPath = request.getContextPath();
        System.out.println("conPath : " + conPath);
        
        String command = uri.substring(conPath.length());
        System.out.println("command : " + command);
        
        if(command.equals("/view/makeAccountSelect.next")) {
           System.out.println(session.getAttribute("dto"));
           MemberDTO dto =(MemberDTO) session.getAttribute("dto");
           System.out.println(dto.toString());
           session.setAttribute("dto", dto);
           viewPage = command.replace(".next", ".jsp");
           System.out.println(viewPage);

        }
        
      //디스패처 포워드
        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
        dispatcher.forward(request, response);  
      
  }


	

}
