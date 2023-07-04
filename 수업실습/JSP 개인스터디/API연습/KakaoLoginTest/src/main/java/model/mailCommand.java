package model;

import java.io.IOException;
import daodto.MemberDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class mailCommand implements memberCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String email = request.getParameter("email");
        MemberDao dao = new MemberDao();
        
        String verifyCode = dao.mailSend(email);
        
        // JSP 파일로 전달할 데이터 설정
        request.setAttribute("verifyCode", verifyCode);
    }

}
