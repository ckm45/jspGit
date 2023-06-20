package kr.co.jsplec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

/**
 * Servlet implementation class Example01
 **/
@WebServlet(urlPatterns = {"/Example01"}, initParams = {@WebInitParam(name ="dbName", value="oracle"), @WebInitParam(name="dbPasswd", value = "123456")})
public class Example01 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Example01() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("doGet");

        String dbnm = getInitParameter("dbName");
        String dbpwd = getInitParameter("dbPasswd");
        response.setContentType("text/html ; charset= EUC-KR");
        PrintWriter pw = response.getWriter();

        pw.write("<html>");
        pw.write("<head>");
        pw.write("</head>");
        pw.write("<body>");
        pw.write("dbName: " + dbnm + "<br/>");
        pw.write("dbPasswd: " + dbpwd + "<br/>");
        pw.write("</body>");
        pw.write("</html>");

        pw.close();

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
