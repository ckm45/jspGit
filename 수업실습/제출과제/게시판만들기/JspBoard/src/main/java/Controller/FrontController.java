package Controller;

import java.io.IOException;
import java.util.ArrayList;
import Model.BoardDTO;
import Model.BoardService;
import Model.InsertBoardImpl;
import Model.SelectBoardImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("doGet 메소드 시작");    
	    actionDo(request,response);
            
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("doPost 메소드 시작");
	    actionDo(request,response);
	}
	
	   private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	          System.out.println("actionDo");
	          
	          String uri = request.getRequestURI();
	          System.out.println("uri : " + uri);
	          
	          String conPath = request.getContextPath();
	          System.out.println("conPath : " + conPath);
	          
	          String command = uri.substring(conPath.length());
	          System.out.println("command : " + command);
	          
	          if(command.equals("/View/insert.do")) {
	             System.out.println("/View/insert.do");
	               BoardService service = new InsertBoardImpl();
	               String name = request.getParameter("name");
	               String title = request.getParameter("title");
	               String content = request.getParameter("content");
	               service.insertBoard(name, title, content);
	               response.sendRedirect("/JspBoard/View/boardMenu.jsp");
	             
	          } else if(command.equals("update.do")) {
	             System.out.println("/update.do");
	             
	          } else if(command.equals("/View/select.do")) {
	             System.out.println("/View/select.do");     
	             BoardService service = new SelectBoardImpl();
	             ArrayList<BoardDTO> dtos = service.selectBoard();
	             //
	             
	             //디스패처 포워드
	             RequestDispatcher dispatcher = request.getRequestDispatcher("/View/boardAll.jsp");
	             request.setAttribute("list", dtos);
	             dispatcher.forward(request, response);
	             
	             
	             
	             for(BoardDTO dto : dtos) {
	                 System.out.println(dto);    
	             }
	             System.out.println("-------------------------");
	          } else if(command.equals("delete.do")) {
	             System.out.println("/delete.do");
	             System.out.println("-------------------------");
	          }
	        
	    }
	
	
}
