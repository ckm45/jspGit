package Model.command;

import Model.daodto.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteCommand implements BoardCommand{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String[] selectedIds = request.getParameterValues("selectedIds");
        System.out.println(selectedIds);
        BoardDAO dao = new BoardDAO();
        dao.deleteBoard(selectedIds);

        
    }
    

}
