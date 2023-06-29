package Model.command;

import Model.daodto.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertCommand implements BoardCommand{
   
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        BoardDAO dao = new BoardDAO();
        
        String name = request.getParameter("name");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        dao.insertBoard(name, title, content);
        
        
    }
}
