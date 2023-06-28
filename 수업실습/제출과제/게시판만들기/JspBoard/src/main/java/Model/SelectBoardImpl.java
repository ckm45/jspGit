package Model;

import java.util.ArrayList;

public class SelectBoardImpl implements BoardService {

    @Override
    public ArrayList<BoardDTO> selectBoard() {
        
        BoardDAO dao = new BoardDAO();
        ArrayList<BoardDTO> dtos = dao.memberAllSelect();
        return dtos;
        
    }

    @Override
    public void insertBoard(String name, String title, String context) {
        BoardDAO dao = new BoardDAO();
        
        
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
