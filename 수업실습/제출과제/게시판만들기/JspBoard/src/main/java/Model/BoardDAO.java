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

    // 전체 출력 메소드
    public ArrayList<BoardDTO> selectAllBoard() {
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
                int view = rs.getInt("board_view");

                BoardDTO dto = new BoardDTO(id, name, title, content, write_date, board_group,
                        board_level, indent, view);
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

    // 상세페이지 메소드
    public BoardDTO selectBoard(int findId) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        BoardDTO dto = null;
        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from board where id = '" + findId + "'");
            System.out.println("while문 시작전");
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String date = rs.getString("write_date");
                String group = rs.getString("board_group");
                String level = rs.getString("board_level");
                String indent = rs.getString("indent");
                int view = rs.getInt("board_view");
                dto = new BoardDTO(id, name, title, content, date, group, level, indent, view);

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


    // 게시글insert 전에 이전 DB값과 비교하여 group을 설정해주는 메소드
    public BoardDTO CheckInsert(String name, String title, String content) {

        int group = 0;
        ArrayList<BoardDTO> dtos = selectAllBoard();
        for (BoardDTO dto : dtos) {
            System.out.println(dto.getGroup());
            if (Integer.parseInt(dto.getGroup()) > group) {
                group = Integer.parseInt(dto.getGroup());

            }
        }
        // group 값이 (분류) 현재 테이블중에서 가장 큰 숫자가 되어있다

        BoardDTO dto = new BoardDTO(name, title, content);
        // 객체 생성하는데 3개짜리 매개변수 생성자를 호출해서 만들어
        // 이 3개짜리 생성자 객체의 group = null;
        // setter를 사용해서 아까 테이블중에 가장 큰 값 저장해놓은 것 있지
        // 거기에 + 1
        dto.setGroup(String.valueOf(group + 1));

        return dto;

    }

    // 게시글 한 개 작성 메소드
    public void insertBoard(String name, String title, String content) {
        System.out.println("insert메소드 시작");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDTO dto = CheckInsert(name, title, content);

        String query =
                "INSERT INTO BOARD (NAME, TITLE, CONTENT, BOARD_GROUP)\r\n" + "VALUES (?, ?, ?, ?)";

        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getGroup());
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

    public void updateBoard(int id, String name, String title, String content) {
        System.out.println("Update메소드 시작");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String query ="update board set name = ?, title = ?, content = ? where id = ?";


        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, title);
            pstmt.setString(3, content);
            pstmt.setInt(4, id);
            int iResult = pstmt.executeUpdate();

            if (iResult >= 1) {
                System.out.println("update success");

            } else {
                System.out.println("update fail");
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
