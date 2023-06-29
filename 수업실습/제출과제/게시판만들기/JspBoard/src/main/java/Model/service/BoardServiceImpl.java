package Model.service;

import java.util.ArrayList;
import Model.daodto.BoardDAO;
import Model.daodto.BoardDTO;

public class BoardServiceImpl implements BoardService{

    @Override
    public ArrayList<BoardDTO> selectAllBoard() {
        
        BoardDAO dao = new BoardDAO();
        ArrayList<BoardDTO> dtos = dao.selectAllBoard();
        return dtos;
        
    }

    @Override
    public BoardDTO selectBoard(int id) {
        
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.selectBoard(id); 
        
        return dto;
    }

    @Override
    public void insertBoard(String name, String title, String content) {
        
        BoardDAO dao = new BoardDAO();
        dao.insertBoard(name, title, content);
    }

    @Override
    public void updateBoard(int id, String name, String title, String content) {
        BoardDAO dao = new BoardDAO();
        dao.updateBoard(id, name, title, content);
    }

    @Override
    public void deleteBoard(String[] ids) {
        BoardDAO dao = new BoardDAO();
        dao.deleteBoard(ids);
    }

}
