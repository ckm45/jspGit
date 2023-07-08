package model;

import java.io.IOException;
import daodto.MemberDao;
import daodto.MemberDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class loginCommand implements memberCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        System.out.println(id);
        System.out.println(pw);
        MemberDao dao = new MemberDao();
        MemberDto dto = dao.memberLoginCheck(id,pw);
        System.out.println(dto.toString());
          
        if(dto == null) {
            session.setAttribute("loginResult", false);           
        
        }else {
           
            session.setAttribute("dto", dto);
            session.setAttribute("loginResult", true);
            System.out.println("로그인 성공 command");
        }

    }

}
