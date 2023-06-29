package Model.service;

import java.util.ArrayList;
import Model.daodto.BoardDAO;
import Model.daodto.BoardDTO;

public class UpdateBoardImpl implements BoardService {

    @Override
    public ArrayList<BoardDTO> selectAllBoard() {
        return null;
        // TODO Auto-generated method stub

    }

    @Override
    public void insertBoard(String name, String title, String context) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void updateBoard(int id, String name, String title, String context) {
        BoardDAO dao = new BoardDAO();
        dao.updateBoard(id, name, title, context);
        

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
