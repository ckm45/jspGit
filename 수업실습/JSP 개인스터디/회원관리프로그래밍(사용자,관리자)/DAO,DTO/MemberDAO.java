package com.day0625;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;


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

        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from member");

            while (rs.next()) {
                String name = rs.getString("name");
                String id = rs.getString("id");
                String pw = rs.getString("pw");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String status = rs.getString("status");

                String permission = rs.getString("permission");

                MemberDTO dto = new MemberDTO(name, id, pw, phone, email);
                dto.setStatus(status);
                dto.setPermission(permission);
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


    public MemberDTO memberSelect(String uId) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        try { // conn = DriverManager.getConnection(url, uid, upw); conn = ds.getConnection(); stmt
              // =
            conn.createStatement();
            rs = stmt.executeQuery("select * from member where id = '" + uId + "'");

            while (rs.next()) {
                String name = rs.getString("name");
                String id = rs.getString("id");
                String pw = rs.getString("pw");
                String phone1 = rs.getString("phone1");
                String phone2 = rs.getString("phone2");
                String phone3 = rs.getString("phone3");
                String gender = rs.getString("gender");

                dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);

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


    public boolean validatePassword(String password) {
        // 비밀번호는 영어 문자와 숫자로만 이루어져야 합니다.
        if (!password.matches("[a-zA-Z0-9]+")) {
            return false;
        }

        // 비밀번호는 최소 4글자 이상이어야 합니다.
        if (password.length() < 4) {
            return false;
        }

        return true;
    }

    public boolean joinCheck(String name, String id, String pw, String phone, String email) {
        boolean ck = false;

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        try {
            if (validatePassword(pw)) {

                // conn = DriverManager.getConnection(url, uid, upw);
                conn = ds.getConnection();
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM members");

                while (rs.next()) {
                    String ckId = rs.getString("ID");

                    if (!id.equals(ckId)) {

                        ck = true;

                    } else {
                        System.out.println("join fail");

                    }
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
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String name = memberDTO.getName();
        String id = memberDTO.getId();
        String pw = memberDTO.getPw();
        String phone = memberDTO.getPhone();
        String email = memberDTO.getEmail();
        String status = memberDTO.getStatus();
        String permission = memberDTO.getPermission();
        status = "active";
        memberDTO.setStatus(status);
        String query =
                "insert into member(name, id, pw, phone, email, status, permission)  values( ?, ?, ?, ?, ?, ?, ? )";

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
            pstmt.setString(7, permission);
            int iResult = pstmt.executeUpdate();

            if (iResult >= 1) {
                System.out.println("insert success");

            } else {
                System.out.println("insert fail");
            }
        } catch (Exception e) {

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

    public boolean loginCheck(String ckId, String ckPw) {
        boolean ck = false;

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM member");

            while (rs.next()) {
                String id = rs.getString("ID");
                String pw = rs.getString("PW");
                String name = rs.getString("NAME");
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



    /*
     * public void memberUpdate(MemberDTO memberDTO) {
     * 
     * Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
     * 
     * String name = memberDTO.getName(); String id = memberDTO.getId(); String pw =
     * memberDTO.getPw(); String phone1 = memberDTO.getPhone1(); String phone2 =
     * memberDTO.getPhone2(); String phone3 = memberDTO.getPhone3(); String gender =
     * memberDTO.getGender(); String query =
     * "update member set name = ?, pw = ?, phone1 = ?, phone2 = ?, phone3 = ?, gender = ?  where id = ?"
     * ;
     * 
     * try { // conn = DriverManager.getConnection(url, uid, upw); conn = ds.getConnection(); pstmt
     * = conn.prepareStatement(query); pstmt.setString(1, name); pstmt.setString(2, pw);
     * pstmt.setString(3, phone1); pstmt.setString(4, phone2); pstmt.setString(5, phone3);
     * pstmt.setString(6, gender); pstmt.setString(7, id);
     * 
     * int iResult = pstmt.executeUpdate();
     * 
     * if (iResult >= 1) { System.out.println("update success");
     * 
     * } else { System.out.println("update fail"); } } catch (Exception e) {
     * 
     * } finally { try { if (rs != null) rs.close(); if (pstmt != null) pstmt.close(); if (conn !=
     * null) conn.close(); } catch (Exception e) { e.printStackTrace(); } } }
     */
}
