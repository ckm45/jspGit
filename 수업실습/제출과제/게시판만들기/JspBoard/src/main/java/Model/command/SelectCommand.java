package Model.command;

import Model.daodto.BoardDAO;
import Model.daodto.BoardDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SelectCommand implements BoardCommand  {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        BoardDAO dao = new BoardDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        //int id = (int) request.getAttribute("id");
        BoardDTO dto = dao.selectBoard(id); 
        
        request.setAttribute("dto", dto);
    }

}
