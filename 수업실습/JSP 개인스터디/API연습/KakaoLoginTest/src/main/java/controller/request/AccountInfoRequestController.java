package controller.request;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import message.AccountUpdateInfoDTO;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import service.AccountInfoService;
import service.AccountInfoServiceImpl;
import vo.AccountInfoDTO;

@WebServlet({"/accounts", "/username", "/my-accounts", "/registrate",
        "/view/accountInfo/insertAccount"})
public class AccountInfoRequestController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final OkHttpClient client = new OkHttpClient();
    private final Gson gson =
            new GsonBuilder().registerTypeAdapter(Date.class, new JsonDeserializer<Date>() {
                DateFormat df = new SimpleDateFormat("MMM dd, yyyy", Locale.ENGLISH);

                @Override
                public Date deserialize(final JsonElement json, final Type typeOfT,
                        final JsonDeserializationContext context) throws JsonParseException {
                    try {
                        return df.parse(json.getAsString());
                    } catch (ParseException e) {
                        throw new JsonParseException(e);
                    }
                }
            }).create();

    public AccountInfoRequestController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        String comPath = request.getContextPath();
        String command = uri.substring(comPath.length());
        if (command.equals("/accounts")) {
            String personalIdNumber = request.getParameter("personalIdNumber");
            // Base64를 통하여 입력받은 주민등록번호를 인코딩(보안 강화)
            String encodedIdNumber =
                    Base64.getEncoder().encodeToString(personalIdNumber.getBytes());

            String url = "http://15.164.234.117/openapi/account-info?personalIdNumber="
                    + encodedIdNumber;

            Request okHttpRequest = new Request.Builder().url(url).get().build();

            List<AccountInfoDTO> accountInfos = new ArrayList<>();

            try {
                Response okHttpResponse = client.newCall(okHttpRequest).execute();
                if (okHttpResponse.isSuccessful() && okHttpResponse.body() != null) {
                    // OpenAPI 서버로부터 받은 응답
                    String apiResponse = okHttpResponse.body().string();

                    // 각 은행의 응답 리스트
                    Type responseType = new TypeToken<ArrayList<String>>() {}.getType();
                    List<String> bankResponses = gson.fromJson(apiResponse, responseType);

                    // 각 은행 응답에 대해 처리
                    for (String bankResponse : bankResponses) {
                        Type listType = new TypeToken<ArrayList<AccountInfoDTO>>() {}.getType();
                        List<AccountInfoDTO> bankAccountInfos =
                                gson.fromJson(bankResponse, listType);
                        accountInfos.addAll(bankAccountInfos);
                    }

                    System.out.println("Account Information: " + accountInfos);
                } else {
                    throw new IOException("Unexpected code " + okHttpResponse);
                }
            } catch (IOException e) {
                System.out.println("Failed to get account information: " + e.getMessage());
                throw new ServletException("Failed to get account information", e);
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(gson.toJson(accountInfos));
        } else if (command.equals("/my-accounts")) {
            String personalIdNumber = request.getParameter("personalIdNumber");
            // Base64를 통하여 입력받은 주민등록번호를 인코딩(보안 강화)
            String encodedIdNumber =
                    Base64.getEncoder().encodeToString(personalIdNumber.getBytes());

            String url = "http://15.164.234.117/openapi/my-account-info?personalIdNumber="
                    + encodedIdNumber;

            Request okHttpRequest = new Request.Builder().url(url).get().build();

            List<AccountInfoDTO> accountInfos = new ArrayList<>();

            try {
                Response okHttpResponse = client.newCall(okHttpRequest).execute();
                if (okHttpResponse.isSuccessful() && okHttpResponse.body() != null) {
                    // OpenAPI 서버로부터 받은 응답
                    String apiResponse = okHttpResponse.body().string();

                    // 각 은행의 응답 리스트
                    Type responseType = new TypeToken<ArrayList<String>>() {}.getType();
                    List<String> bankResponses = gson.fromJson(apiResponse, responseType);

                    // 각 은행 응답에 대해 처리
                    for (String bankResponse : bankResponses) {
                        Type listType = new TypeToken<ArrayList<AccountInfoDTO>>() {}.getType();
                        List<AccountInfoDTO> bankAccountInfos =
                                gson.fromJson(bankResponse, listType);
                        accountInfos.addAll(bankAccountInfos);
                    }

                    System.out.println("Account Information: " + accountInfos);
                } else {
                    throw new IOException("Unexpected code " + okHttpResponse);
                }
            } catch (IOException e) {
                System.out.println("Failed to get account information: " + e.getMessage());
                throw new ServletException("Failed to get account information", e);
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(gson.toJson(accountInfos));
        } else if (command.equals("/username")) {
            String accountNumber = request.getParameter("accountNumber");

            String bankCode = request.getParameter("bankCode");

            String url = "http://15.164.234.117/openapi/username?accountNumber=" + accountNumber
                    + "&bankCode=" + bankCode;

            Request okHttpRequest = new Request.Builder().url(url).get().build();
            try {
                Response okHttpResponse = client.newCall(okHttpRequest).execute();
                if (okHttpResponse.isSuccessful() && okHttpResponse.body() != null) {
                    // 응답받은 데이터를 String으로 변환
                    String responseData = okHttpResponse.body().string();

                    // 응답 데이터를 클라이언트에게 전송
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(responseData);
                } else {
                    throw new IOException("Unexpected code " + okHttpResponse);
                }
            } catch (IOException e) {
                System.out.println("Failed to get account information: " + e.getMessage());
                throw new ServletException("Failed to get account information", e);
            }
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        String comPath = request.getContextPath();
        String command = uri.substring(comPath.length());
        if (command.equals("/registrate")) {
            // Request body를 String으로 가져옴
            StringBuilder buffer = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            String data = buffer.toString();

            // 받아온 JSON 문자열을 계좌 정보 DTO 객체 리스트로 변환
            Type listType = new TypeToken<ArrayList<AccountUpdateInfoDTO>>() {}.getType();
            List<AccountUpdateInfoDTO> accountInfos = gson.fromJson(data, listType);

            for (AccountUpdateInfoDTO accountInfo : accountInfos) {
                // Gson으로 DTO 객체를 JSON 문자열로 변환
                String jsonPayload = gson.toJson(accountInfo);

                // HttpURLConnection을 이용하여 PUT 요청 보내기
                URL url = new URL("http://15.164.234.117/openapi/registrate");
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("PUT");
                connection.setDoOutput(true);
                connection.setRequestProperty("Content-Type", "application/json; utf-8");
                connection.setRequestProperty("Accept", "application/json");

                byte[] postData = jsonPayload.getBytes(StandardCharsets.UTF_8);
                OutputStream outputStream = connection.getOutputStream();
                outputStream.write(postData);
                outputStream.flush();
                outputStream.close();

                int responseCode = connection.getResponseCode();
                if (responseCode != HttpURLConnection.HTTP_OK) {
                    // 에러 메시지 전송
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter()
                            .write("{\"message\":\"Error occurred while updating account "
                                    + accountInfo.getAccountNumber() + ". Response Code: "
                                    + responseCode + "\"}");
                    return;
                }
                connection.disconnect();
            }

            // 모든 계좌 정보가 성공적으로 업데이트 되었다고 가정하고, 클라이언트에게 성공 메시지를 보냅니다.
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"message\":\"All accounts successfully updated.\"}");
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost 실행");
        String viewPage = null;
        String uri = request.getRequestURI();
        System.out.println("uri: " + uri);

        String conPath = request.getContextPath();
        System.out.println("conPath: " + conPath);

        String command = uri.substring(conPath.length() + 18);
        System.out.println("command: " + command);
        
        if(command.equals("insertAccount")) {
            String memberId = request.getParameter("memberId");
            String productName = request.getParameter("product-name");
            String bankCode = request.getParameter("bank");
            String nickname = request.getParameter("account-nickname");
            String accountPassword = request.getParameter("account-password");
            
            AccountInfoService service = new AccountInfoServiceImpl();
            service.insertAccount(memberId, productName, bankCode, nickname, accountPassword);
            viewPage = "/KakaoLoginTest/view/mainHana.jsp";
            response.sendRedirect(viewPage);
            
        }
    }
}
