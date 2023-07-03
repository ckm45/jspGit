package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.json.JSONObject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.kakaoLoginCommand;
import model.memberCommand;

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        actionDo(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*
         * BufferedReader reader = new BufferedReader(new
         * InputStreamReader(request.getInputStream())); String json = ""; if (reader != null) {
         * json = reader.readLine(); }
         * 
         * // JSON 데이터 처리 // 예시로 출력만 함 System.out.println("Received JSON Data: " + json);
         * 
         * // 필요한 작업 수행 JSONObject jsonObject = new JSONObject(json); JSONObject properties =
         * jsonObject.getJSONObject("properties"); String nickname =
         * properties.getString("nickname"); long id = jsonObject.getLong("id");
         * 
         * String viewPage = "/KakaoLoginTest/loginSuccess.jsp"; System.out.println(request);
         * System.out.println(response); System.out.println("ID: " + id);
         * System.out.println("Nickname: " + nickname);
         * 
         * 
         * // 디스패처 포워드 request.getRequestDispatcher(viewPage).forward(request, response);
         * System.out.println("Forwarding to: " + viewPage);
         */
        actionDo(request, response);
    }



    private void actionDo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getRequestURI();
        System.out.println("uri : " + uri);

        String conPath = request.getContextPath();
        System.out.println("conPath : " + conPath);

        String command = uri.substring(conPath.length());
        System.out.println("command : " + command);

        if (command.equals("/login.do")) {
            System.out.println("login.do");
            memberCommand mc = new kakaoLoginCommand();
            mc.execute(request, response);

         
        }
    }
}
