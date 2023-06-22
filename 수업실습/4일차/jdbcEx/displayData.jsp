<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Data</title>
</head>
<body>
    <%
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink19.dbsvr";
        String uid = "scott";
        String upw = "tiger";
        String query = "SELECT * FROM member"; 
        
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, uid, upw);
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            
            out.println("Members:<br>");
            
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String pw = resultSet.getString("pw");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                
                out.println("ID: " + id + ", Password: " + pw + ", Name: " + name + ", Phone: " + phone + "<br>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close resources in the finally block
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
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
    
    <a href="insertForm.jsp">Add New Member</a>
</body>
</html>
