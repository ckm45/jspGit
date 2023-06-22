<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 성공</h1>
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
                String phone1 = resultSet.getString("phone1");
                String phone2 = resultSet.getString("phone2");
                String phone3 = resultSet.getString("phone3");
                String gender = resultSet.getString("gender");
                
                
                out.println("ID: " + id + ", Password: " + pw + ", Name: " + name + ", Phone: " + phone1 + phone2 + phone3 + ", Gender:" + gender + "<br>");
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
    <a href="/JspClass/com/day0622/MemberEx/LoginEx/login.html">로그인 하러가기</a>
</body>
</html>