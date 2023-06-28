package Model;

import java.util.ArrayList;

public interface BoardService {
    
    public ArrayList<BoardDTO> selectBoard();
    
    public void insertBoard(String name, String title, String context);
    
    public void updateBoard();
    
    public void deleteBoard();
    
    
}
