package model;

import java.io.IOException;
import java.io.PrintWriter;
import daodto.MemberDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class checkIdCommand implements memberCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String uId = request.getParameter("id");
        MemberDao dao = new MemberDao();
        boolean ckResult = dao.checkId(uId);
        System.out.println(ckResult + ": execute 실행");
        //request.setAttribute("ckResult", ckResult);

        // AJAX 응답 처리
        response.setContentType("text/plain");  // JSON 혹은 다른 형태의 응답을 반환하려면 콘텐트 타입을 적절히 변경
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(ckResult);  // boolean 값 반환. 필요에 따라 String 으로 변환할 수 있음.
        out.flush();
    }

}
