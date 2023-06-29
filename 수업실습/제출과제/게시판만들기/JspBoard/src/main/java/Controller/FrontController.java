package controller;

import java.io.IOException;
import Model.command.BoardCommand;
import Model.command.DeleteCommand;
import Model.command.InsertCommand;
import Model.command.SelectAllCommand;
import Model.command.SelectCommand;
import Model.service.BoardService;
import Model.service.UpdateBoardImpl;
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
	          
	          String viewPage = null;
	          String uri = request.getRequestURI();
	          System.out.println("uri : " + uri);
	          
	          String conPath = request.getContextPath();
	          System.out.println("conPath : " + conPath);
	          
	          String command = uri.substring(conPath.length());
	          System.out.println("command : " + command);
	          
	          if(command.equals("/View/insert.do")) {
	             System.out.println("/View/insert.do");
	             
	               //BoardService service = new InsertBoardImpl();
	               //String name = request.getParameter("name");
	               //String title = request.getParameter("title");
	               //String content = request.getParameter("content");
	               //service.insertBoard(name, title, content);
	             
	             BoardCommand boardCommand = new InsertCommand();
	             boardCommand.execute(request,response);	             
	             viewPage ="/View/boardMenu.jsp";
	             //response.sendRedirect("/JspBoard/View/boardMenu.jsp");
	             
	          } else if(command.equals("/View/update.do")) {
	             System.out.println("/View/update.do");
	             BoardService service = new UpdateBoardImpl();
//	             int id = Integer.parseInt(request.getParameter("id"));
//	             String name = request.getParameter("name");
//                 String title = request.getParameter("title");
//                 String content = request.getParameter("content");
//                 service.updateBoard(id, name, title, content);
	             viewPage = "/View/boardMenu.jsp";
	             
                 //response.sendRedirect("/JspBoard/View/boardMenu.jsp");
	             
	          } else if(command.equals("/View/select.do")) {
	             System.out.println("/View/select.do");     
	             BoardCommand boardCommand = new SelectAllCommand();
	             
	             //BoardService service = new SelectAllBoardImpl();
	             boardCommand.execute(request,response);
	             //
	             viewPage = "/View/boardAll.jsp";	             
	            
	          } 
	          
	          //세부 select 
	          else if(command.contains("/View/subBoard.do")) {
	              //조회수 증가 메소드 실행 필요
	              //int id = Integer.parseInt(request.getParameter("id"));
	              //request.setAttribute("id", id);
	              BoardCommand boardCommand = new SelectCommand();
	              boardCommand.execute(request,response);
	              
	              viewPage = "/View/subBoard.jsp";              
	              
	          }
	          else if(command.equals("/View/delete.do")) {
	             //String[] selectedIds = request.getParameterValues("selectedIds");
	              
	             System.out.println("/delete.do");
                 BoardCommand boardCommand = new DeleteCommand();
                 boardCommand.execute(request, response);
	             //BoardService service = new DeleteBoardImpl();
                 //service.deleteBoard(selectedIds);
                 viewPage = "/View/boardMenu.jsp";
                 //response.sendRedirect("/JspBoard/View/boardMenu.jsp");
	          }
	          
	        //디스패처 포워드
              RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
              dispatcher.forward(request, response);  
	        
	    }
	
	
}
