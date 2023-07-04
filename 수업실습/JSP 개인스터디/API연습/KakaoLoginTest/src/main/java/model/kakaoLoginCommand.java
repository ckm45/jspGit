package model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.json.JSONObject;
import daodto.MemberDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class kakaoLoginCommand implements memberCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
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

        System.out.println("ID: " + id);
        System.out.println("Nickname: " + nickname);
        
        dao.insertMember(id, nickname);
        

    }

}
