package Model.service;

import java.util.ArrayList;
import Model.daodto.BoardDTO;

public interface BoardService {
    
    //게시글 전체 조회
    public ArrayList<BoardDTO> selectAllBoard();
    
    //게시글 세부글 조회
    public BoardDTO selectBoard(int id);
    
    //게시글 작성
    public void insertBoard(String name, String title, String context);
    
    //게시글 수정
    public void updateBoard(int id, String name, String title, String context);
    
    //게시글 삭제
    public void deleteBoard(String[] ids);
    
    
    
}
