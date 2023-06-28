package Model;

import java.util.ArrayList;

public class SelectBoardImpl implements BoardService {

    @Override
    public ArrayList<BoardDTO> selectAllBoard() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void insertBoard(String name, String title, String context) {
        // TODO Auto-generated method stub

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
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.selectBoard(id); 
        
        
        
        return dto;
    }

}
