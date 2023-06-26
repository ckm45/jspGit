package com.day0625;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {

    /*
     * private String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink19.dbsvr"; private String
     * uid = "scott"; private String upw = "tiger";
     */
    private DataSource ds;

    public MemberDAO() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public ArrayList<MemberDTO> memberAllSelect() {
        ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try { // conn = DriverManager.getConnection(url, uid, upw); conn = ds.getConnection(); stmt
              // =
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from members");

            System.out.println("test");
            while (rs.next()) {
                String name = rs.getString("name");
                String id = rs.getString("id");
                String pw = rs.getString("password");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String status = rs.getString("status");
                String auth = rs.getString("auth");

                MemberDTO dto = new MemberDTO(name, id, pw, phone, email, status, auth);
                dtos.add(dto);
            }
        } catch (Exception e) {

            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return dtos;
    }

    public MemberDTO memberSelect(String uId) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from members where id = '" + uId + "'");
            System.out.println("while문 시작전");
            while (rs.next()) {
                String name = rs.getString("name");
                String id = rs.getString("id");
                String pw = rs.getString("password");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String status = rs.getString("status");
                String auth = rs.getString("auth");

                dto = new MemberDTO(name, id, pw, phone, email, status, auth);

            }

        } catch (Exception e) {

        } finally {
            try {

                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return dto;
    }

    // 회원가입 승인 이전 메소드
    public ArrayList<MemberDTO> memberBeforeSelect() {
        ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from members where status = 'pending' ");

            while (rs.next()) {
                String name = rs.getString("name");
                String id = rs.getString("id");
                String pw = rs.getString("password");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String status = rs.getString("status");
                String auth = rs.getString("auth");
                MemberDTO dto = new MemberDTO(name, id, pw, phone, email, status, auth);
                dtos.add(dto);
            }
        } catch (Exception e) {

        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return dtos;
    }

    // 회원가입 승인처리 메소드
    public boolean joinOkfunction(String id) {
        boolean result = true;
        Connection conn = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        PreparedStatement pstmt = null;

        try {
            conn = ds.getConnection();

            // SQL 쿼리 작성
            String sql = "UPDATE members SET status = 'active' WHERE status = 'pending' AND id = ?";

            // PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);

            // 매개변수 값 설정
            pstmt.setString(1, id);

            // 쿼리 실행
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }



    public boolean validatePassword(String password) {
        boolean result = false;
        // 비밀번호는 최소 4글자 이상이어야 합니다.
        if (password.length() < 4) {
            result = false;
        }

        boolean containsNumber = false;
        boolean containsLetter = false;

        for (int i = 0; i < password.length(); i++) {
            char ch = password.charAt(i);

            // 아스키코드를 사용하여 숫자인지 확인합니다.
            if (ch >= '0' && ch <= '9') {
                containsNumber = true;
            }
            // 아스키코드를 사용하여 문자인지 확인합니다.
            else if ((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z')) {
                containsLetter = true;
            }

            // 숫자와 문자가 모두 존재하면 검증을 종료합니다.
            if (containsNumber && containsLetter) {
                result = true;
            }
        }
        System.out.println(result);
        return result;
    }


    public boolean joinCheck(String name, String id, String pw, String phone, String email) {
        boolean ck = false;

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        try {
            if (validatePassword(pw)) {
                System.out.println("if문 시작");
                conn = ds.getConnection();
                stmt = conn.createStatement();

                // 쿼리를 수정하여 조건에 맞는 회원을 가져옵니다.
                String query = "SELECT * FROM members WHERE ID = '" + id + "'";
                rs = stmt.executeQuery(query);

                if (rs.next()) {
                    // 이미 해당 아이디가 존재하는 경우
                    System.out.println("join fail");
                } else {
                    // 해당 아이디가 존재하지 않는 경우
                    ck = true;
                }
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            try {

                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return ck;
    }
    
    public void memberInsert(MemberDTO memberDTO) {
        System.out.println("insert메소드 시작");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String name = memberDTO.getName();
        String id = memberDTO.getId();
        String pw = memberDTO.getPw();
        String phone = memberDTO.getPhone();
        String email = memberDTO.getEmail();
        String status = memberDTO.getStatus();
        String auth = memberDTO.getAuth();
        memberDTO.setStatus(status);
        String query =
                "insert into members(name, id, password, phone, email, status, auth)  values( ?, ?, ?, ?, ?, ?, ? )";

        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, id);
            pstmt.setString(3, pw);
            pstmt.setString(4, phone);
            pstmt.setString(5, email);
            pstmt.setString(6, status);
            System.out.println(memberDTO.getStatus());
            pstmt.setString(7, auth);
            System.out.println("execute전");
            int iResult = pstmt.executeUpdate();
            System.out.println(iResult);
            System.out.println("execute후");
            if (iResult >= 1) {
                System.out.println("insert success");

            } else {
                System.out.println("insert fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    public boolean adminLoginCheck(String ckId, String ckPw) {
        boolean ck = false;
        System.out.println("login체크");
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM members WHERE auth = 'admin'");

            while (rs.next()) {
                String id = rs.getString("id");

                String pw = rs.getString("password");
                System.out.println("id: " + id + "|pw : " + pw);
                if (ckId.equals(id) && ckPw.equals(pw)) {

                    ck = true;

                } else {
                    System.out.println("login fail");

                }
            }

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            try {

                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return ck;
    }

    public boolean memberLoginCheck(String ckId, String ckPw) {
        boolean ck = false;
        System.out.println("login체크");
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        try {
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM members WHERE auth = 'user' AND status = 'active'");

            while (rs.next()) {
                String id = rs.getString("id");
                String pw = rs.getString("password");
                System.out.println("id: " + id + "|pw : " + pw);
                if (ckId.equals(id) && ckPw.equals(pw)) {
                    ck = true;
                } else {
                    System.out.println("login fail");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return ck;
    }

    
    
    public void memberUpdate(String id, String field, String context) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String query = "UPDATE members SET " + field + " = ? WHERE id = ?";

        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, context);
            pstmt.setString(2, id);

            int iResult = pstmt.executeUpdate();

            if (iResult >= 1) {
                System.out.println("Update success");
            } else {
                System.out.println("Update fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    //회원 삭제 요청 메소드
    public void memberDelete(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String query = "UPDATE members SET status = 'Suspended'  WHERE id = ?";

        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);

            int iResult = pstmt.executeUpdate();

            if (iResult >= 1) {
                System.out.println("Update success");
            } else {
                System.out.println("Update fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    //탈퇴 요청 회원 찾는 메소드 
    public ArrayList<MemberDTO> memberBeforeDelete() {
        ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from members where status = 'Suspended' ");

            while (rs.next()) {
                String name = rs.getString("name");
                String id = rs.getString("id");
                String pw = rs.getString("password");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String status = rs.getString("status");
                String auth = rs.getString("auth");
                MemberDTO dto = new MemberDTO(name, id, pw, phone, email, status, auth);
                dtos.add(dto);
            }
        } catch (Exception e) {

        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return dtos;
    }
    
    //탈퇴 승인 메소드
    public boolean deleteOkfunction(String id) {
        boolean result = true;
        Connection conn = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        PreparedStatement pstmt = null;

        try {
            conn = ds.getConnection();

            // SQL 쿼리 작성
            String sql = "DELETE FROM members WHERE status = 'Suspended' AND id = ?";

            // PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);

            // 매개변수 값 설정
            pstmt.setString(1, id);

            // 쿼리 실행
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }


}
