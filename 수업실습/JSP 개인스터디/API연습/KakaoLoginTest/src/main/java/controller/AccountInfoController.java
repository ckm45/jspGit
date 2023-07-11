package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AccountService;
import service.AccountServiceImpl;

/**
 * Servlet implementation class AccountInfoController
 */


@WebServlet("/view/accountInfo/*")
public class AccountInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost 실행");
        String viewPage = null;
        String uri = request.getRequestURI();
        System.out.println("uri: " + uri);

        String conPath = request.getContextPath();
        System.out.println("conPath: " + conPath);

        String command = uri.substring(conPath.length() + 18);
        System.out.println("command: " + command);
        
        if(command.equals("insertAccount")) {
            String memberId = request.getParameter("memberId");
            String productName = request.getParameter("product-name");
            String bankCode = request.getParameter("bank");
            String nickname = request.getParameter("account-nickname");
            String accountPassword = request.getParameter("account-password");
            
            AccountService service = new AccountServiceImpl();
            service.insertAccount(memberId, productName, bankCode, nickname, accountPassword);
            viewPage = "/KakaoLoginTest/view/mainHana.jsp";
            response.sendRedirect(viewPage);
            
        }
	}

}
