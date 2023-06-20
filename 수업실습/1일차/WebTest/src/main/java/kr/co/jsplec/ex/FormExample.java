package kr.co.jsplec.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FormExample
 */
public class FormExample extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormExample() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");
        String[] hobby = request.getParameterValues("hobby");
        System.out.println("name: " + name + " id: " + id + "| passwd:" + passwd);
        System.out.println("hobby:  " + Arrays.toString(hobby));

        response.setContentType("text/html ; charset= UTF-8");
        PrintWriter pw = response.getWriter();

        pw.write("<html>");
        pw.write("<head>");
        pw.write("</head>");
        pw.write("<body>");
        pw.write("name: " + name + "| id:  " + id + "| passwd:  " + passwd + "<br/>");
        pw.write("hobby:  " + Arrays.toString(hobby));
        pw.write("</body>");
        pw.write("</html>");

        pw.close();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doPost");

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");
        String[] hobby = request.getParameterValues("hobby");
        System.out.println("name: " + name + "| id: " + id + "| passwd:" + passwd);
        System.out.println("hobby:  " + Arrays.toString(hobby));

        response.setContentType("text/html ; charset= EUC-KR");
        PrintWriter pw = response.getWriter();

        pw.write("<html>");
        pw.write("<head>");
        pw.write("</head>");
        pw.write("<body>");
        pw.write("name: " + name + "| id:  " + id + "| passwd:  " + passwd + "<br/>");
        pw.write("hobby:  " + Arrays.toString(hobby));
        pw.write("</body>");
        pw.write("</html>");

        pw.close();


    }

}
