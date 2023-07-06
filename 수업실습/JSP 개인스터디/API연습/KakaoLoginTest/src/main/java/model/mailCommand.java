package model;

import java.io.IOException;
import java.io.PrintWriter;
import daodto.MemberDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class mailCommand implements memberCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String email = request.getParameter("email");
        MemberDao dao = new MemberDao();
        System.out.println(email);
        String verifyCode = dao.mailSend(email);
        System.out.println(verifyCode);
        // JSP 파일로 전달할 데이터 설정
        //request.setAttribute("verifyCode", verifyCode);
        // AJAX 응답 처리
        response.setContentType("text/plain");  // JSON 혹은 다른 형태의 응답을 반환하려면 콘텐트 타입을 적절히 변경
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(verifyCode);  // boolean 값 반환. 필요에 따라 String 으로 변환할 수 있음.
        out.flush();
    }

}
