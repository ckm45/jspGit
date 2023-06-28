package Model;

import java.util.ArrayList;

public class SelectAllBoardImpl implements BoardService {

    @Override
    public ArrayList<BoardDTO> selectAllBoard() {
        
        BoardDAO dao = new BoardDAO();
        ArrayList<BoardDTO> dtos = dao.selectAllBoard();
        return dtos;
        
    }

    @Override
    public void insertBoard(String name, String title, String context) {
        BoardDAO dao = new BoardDAO();
        
        
    }

    @Override
    public void updateBoard(int id, String name, String title, String context) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deleteBoard(String[] ids) {
        // TODO Auto-generated method stub

    }

    @Override
    public BoardDTO selectBoard(int id) {
        // TODO Auto-generated method stub
        return null;
    }



}
