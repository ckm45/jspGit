package model;

import java.io.IOException;
import daodto.MemberDao;
import daodto.MemberDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class joinCommand implements memberCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        System.out.println("execute 실행");
        
        String userId = request.getParameter("id");
        String userPw = request.getParameter("pw");
        String name = request.getParameter("name"); 
        String simplePw = request.getParameter("simplePw");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String personID = request.getParameter("personal_id_1") + request.getParameter("personal_id_2");
        String zipcode = request.getParameter("zipcode");
        String address = request.getParameter("address");
        String detailAddress = request.getParameter("detailAddress");
        
        MemberDto dto = new MemberDto(userId, name, userPw, simplePw, email, phone, personID, zipcode, address, detailAddress);
        
        
        // 주민등록번호에서 7번째 자리 값 확인
        char genderDigit = personID.charAt(6);
        if (genderDigit == '1' || genderDigit == '3') {
            dto.setGender("M");
        } else {
            dto.setGender("F");
        }
        
     // 주민등록번호 6자리 추출
        String birth = personID.substring(0, 6);
        dto.setBirth(birth);
        
        MemberDao dao = new MemberDao();
        if(dao.personIdCheck(dto)) {
            dao.joinMember(dto);
            request.setAttribute("status",true);

        }else {
            System.out.println("else 시작");
            request.setAttribute("status",false);
            HttpSession session = request.getSession();
            session.setAttribute("message", "이미 가입된 회원입니다.");
        }   
        //redirect 해서 다시 이동  
        //컨트롤러에서 forward해서 오류 난듯 
    }

}
