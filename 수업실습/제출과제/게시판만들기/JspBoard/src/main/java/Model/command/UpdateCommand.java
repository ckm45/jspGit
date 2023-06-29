package Model.command;

import Model.daodto.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateCommand implements BoardCommand{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        BoardDAO dao = new BoardDAO();
        dao.updateBoard(id, name, title, content);
        
        
    }
    

}
