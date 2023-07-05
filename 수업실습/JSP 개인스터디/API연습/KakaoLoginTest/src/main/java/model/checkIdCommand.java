package model;

import java.io.IOException;
import daodto.MemberDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class checkIdCommand implements memberCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String uId =request.getParameter("id");
        MemberDao dao = new MemberDao();
        boolean ckResult =dao.checkId(uId);
        System.out.println(ckResult + ": excute 실행");
        request.setAttribute("ckResult", ckResult);
      
              
    }

}
