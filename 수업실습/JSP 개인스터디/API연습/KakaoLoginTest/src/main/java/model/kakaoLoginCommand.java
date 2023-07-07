package model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import org.json.JSONObject;
import com.google.gson.Gson;
import daodto.MemberDao;
import daodto.MemberDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class kakaoLoginCommand implements memberCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        MemberDto dto = null;
        MemberDao dao = new MemberDao();
        
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String json = "";
        if (reader != null) {
            json = reader.readLine();
        }
        
        // JSON 데이터 처리
        // 예시로 출력만 함
        System.out.println("Received JSON Data: " + json);

        // 필요한 작업 수행
        JSONObject jsonObject = new JSONObject(json);
        JSONObject properties = jsonObject.getJSONObject("properties");
        String nickname = properties.getString("nickname");
        long id = jsonObject.getLong("id");
        String convertId = String.valueOf(id);
        System.out.println("ID: " + id);
        System.out.println("Nickname: " + nickname);
        
        if(dao.checkId(convertId)) { //존재하지 않으면 true, 존재하지 않을 때 
            dao.insertKaKaoMember(convertId, nickname); //insert 후 추가 정보 받기 
            request.setAttribute("status",false); //카카오 최초 로그인 (추가 정보 받아야됨)
            
            
        }else {
            
            dto = dao.memberLoginCheck(convertId);
            // 세션에 dto 저장
            System.out.println(dto);
            HttpSession session = request.getSession();
            session.setAttribute("dto", dto);
            session.setAttribute("loginResult", true);
            response.setContentType("application/json");  // 콘텐트 타입을 application/json으로 설정
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();  // Gson 라이브러리를 이용
            out.print(gson.toJson(dto));  // DTO 객체를 JSON 문자열로 변환하여 반환
            out.flush();
            

        }
    }

}
