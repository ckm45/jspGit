package Model.command;

import java.util.ArrayList;
import Model.daodto.BoardDAO;
import Model.daodto.BoardDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SelectAllCommand implements BoardCommand{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        
        BoardDAO dao = new BoardDAO();
        ArrayList<BoardDTO> dtos = dao.selectAllBoard();
        request.setAttribute("dtos", dtos);
        
    }

}
