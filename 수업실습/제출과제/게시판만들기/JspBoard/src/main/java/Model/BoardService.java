package Model;

import java.util.ArrayList;

public interface BoardService {
    
    public ArrayList<BoardDTO> selectBoard();
    
    public void insertBoard();
    
    public void updateBoard();
    
    public void deleteBoard();
    
    
}
