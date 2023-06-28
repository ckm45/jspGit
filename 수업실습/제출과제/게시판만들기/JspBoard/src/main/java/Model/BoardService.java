package Model;

import java.util.ArrayList;

public interface BoardService {
    
    public ArrayList<BoardDTO> selectAllBoard();
    
    public BoardDTO selectBoard(int id);
    
    public void insertBoard(String name, String title, String context);
    
    public void updateBoard(int id, String name, String title, String context);
    
    public void deleteBoard();
    
    
}
