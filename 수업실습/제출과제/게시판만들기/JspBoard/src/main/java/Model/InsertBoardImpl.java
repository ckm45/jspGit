package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class InsertBoardImpl implements BoardService {

    @Override
    public ArrayList<BoardDTO> selectAllBoard() {
        return null;
        // TODO Auto-generated method stub

    }

    @Override
    public void insertBoard(String name, String title, String content) {
        
        BoardDAO dao = new BoardDAO();
        dao.insertBoard(name, title, content);
    }

    @Override
    public void updateBoard(int id, String name, String title, String context) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deleteBoard() {
        // TODO Auto-generated method stub

    }

    @Override
    public BoardDTO selectBoard(int id) {
        // TODO Auto-generated method stub
        return null;
    }

}
