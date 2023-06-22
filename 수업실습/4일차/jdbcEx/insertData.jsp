<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Data</title>
</head>
<body>
    <%
        Connection connection = null;
        Statement statement = null;
        
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink19.dbsvr";
        String uid = "scott";
        String upw = "tiger";
        
        try {
            String newId = request.getParameter("id");
            String newPw = request.getParameter("password");
            String newName = request.getParameter("name");
            String newPhone = request.getParameter("phone");
            String sql = "INSERT INTO member (id, pw, name, phone) VALUES ('" + newId + "', '" + newPw + "', '" + newName + "', '" + newPhone + "')";
            
            Class.forName(driver);
            connection = DriverManager.getConnection(url, uid, upw);
            statement = connection.createStatement();
            
            statement.executeUpdate(sql);
            
            out.println("New member added successfully.");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close resources in the finally block
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
    
    <a href="displayData.jsp">Display Members</a>
</body>
</html>
