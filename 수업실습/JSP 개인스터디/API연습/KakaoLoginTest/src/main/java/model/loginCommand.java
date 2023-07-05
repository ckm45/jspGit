package model;

import java.io.IOException;
import daodto.MemberDao;
import daodto.MemberDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class loginCommand implements memberCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        System.out.println(id);
        System.out.println(pw);
        MemberDao dao = new MemberDao();
        MemberDto dto = dao.memberLoginCheck(id,pw);
        System.out.println(dto);
          
        if(dto == null) {
            
            request.setAttribute("loginResult", false);           
        
        }else {
           
            request.setAttribute("dto", dto);
            request.setAttribute("loginResult", true);
        }

    }

}
