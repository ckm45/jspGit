package model;

import java.io.IOException;
import daodto.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class kakaoJoinCommand implements memberCommand{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String id = request.getParameter("kakaoId");
        System.out.println(id);
        String simplePw = request.getParameter("simplePw");
        String phone = request.getParameter("phone");
        String personID = request.getParameter("personal_id_1") + request.getParameter("personal_id_2");
        String zipcode = request.getParameter("zipcode");
        String address = request.getParameter("address");
        String detailAddress = request.getParameter("detailAddress");
        String gender = null;
        
        //성별 
        char genderDigit = personID.charAt(6);
        if (genderDigit == '1' || genderDigit == '3') {
            gender = "M";
        } else {
            gender = "F";
        }
        // 주민등록번호 6자리 추출
        String birth = personID.substring(0, 6);    
        
        
        
        MemberDao dao = new MemberDao();
        dao.kakaoJoin(id, simplePw, phone, personID, gender, birth, zipcode, address, detailAddress);
        
        
    }

}
