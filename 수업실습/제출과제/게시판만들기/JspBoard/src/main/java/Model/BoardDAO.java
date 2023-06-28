package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
    
    private DataSource ds;

    public BoardDAO() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<BoardDTO> memberAllSelect() {
        ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try { // conn = DriverManager.getConnection(url, uid, upw); conn = ds.getConnection(); stmt
              // =
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from board");

            System.out.println("memberAllSelect 메소드 실행");
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String write_date = rs.getString("write_date");
                String board_group = rs.getString("board_group");
                String board_level = rs.getString("board_level");
                String indent = rs.getString("indent");
                int view= rs.getInt("board_view");

                BoardDTO dto = new BoardDTO(id, name, title, content, write_date, board_group, board_level, indent, view);
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
    
    public void BoardInsert(String name, String title, String content) {
        System.out.println("insert메소드 시작");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String query =
                "insert into members(name, id, password, phone, email, status, auth)  values( ?, ?, ?, ?, ?, ?, ? )";

        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, title);
            pstmt.setString(3, content);
            
            int iResult = pstmt.executeUpdate();
            
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

}
