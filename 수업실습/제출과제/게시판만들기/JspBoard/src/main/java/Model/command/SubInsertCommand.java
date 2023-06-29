package Model.command;

import Model.daodto.BoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SubInsertCommand implements BoardCommand{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("subinsertcommand 시작");
        BoardDAO dao = new BoardDAO();
        
        String name = request.getParameter("name");
        System.out.println(name);
        String title = request.getParameter("title");
        System.out.println(title);
        String content = request.getParameter("content");
        System.out.println(content);
        //본 글의 id값을 답글의 group 값이 되게 한다. 
        int group = Integer.parseInt(request.getParameter("id"));
        System.out.println(request.getParameter("id"));
        System.out.println(group);
        int level = Integer.parseInt(request.getParameter("level")) + 1;
        System.out.println(level);
        int indent = Integer.parseInt(request.getParameter("indent"))+1;
        System.out.println(indent);
        
        dao.subInsertBoard(group, level, indent,  name, title, content ); 
        
    }

}
