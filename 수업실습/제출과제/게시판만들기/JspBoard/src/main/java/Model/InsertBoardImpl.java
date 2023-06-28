package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class InsertBoardImpl implements BoardService {

    @Override
    public ArrayList<BoardDTO> selectBoard() {
        return null;
        // TODO Auto-generated method stub

    }

    @Override
    public void insertBoard(String name, String title, String content) {
        
        BoardDAO dao = new BoardDAO();
        dao.BoardInsert(name, title, content);
    }

    @Override
    public void updateBoard() {
        // TODO Auto-generated method stub

    }

    @Override
    public void deleteBoard() {
        // TODO Auto-generated method stub

    }

}
