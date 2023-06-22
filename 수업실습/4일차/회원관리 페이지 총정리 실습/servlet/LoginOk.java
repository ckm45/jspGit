package com.member.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginOk
 */
@WebServlet("/com/day0622/MemberEx/LoginEx/LoginOk")
public class LoginOk extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String newId, newPw;
    private String query;
    private Connection conn;
    private Statement stmt;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginOk() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doGet");
        actionDo(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doPost");
        actionDo(request, response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        newId = request.getParameter("id");
        newPw = request.getParameter("pw");
        ResultSet resultSet = null;
        query = "SELECT * FROM member";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@192.168.119.119:1521/dink19.dbsvr", "scott", "tiger");
            stmt = conn.createStatement();
            resultSet = stmt.executeQuery(query);

            while (resultSet.next()) {
                String id = resultSet.getString("ID");
                String pw = resultSet.getString("PW");
                String name = resultSet.getString("NAME");
                if (newId.equals(id)&& newPw.equals(pw)) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("id", id);
                    session.setAttribute("name", name);

                    System.out.println("login success");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("loginResult.jsp");
                    dispatcher.forward(request, response);
                    return;
                } else {
                    System.out.println("login fail");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
                    dispatcher.forward(request, response);
                    return;
                }
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            response.sendRedirect("join.html");
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }
        }
    }

}

