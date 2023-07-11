package controller.request;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import message.TransferInfo;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import vo.AccountTransferInfoDTO;

/* transfer는 이체 진행, transfer-info는 계좌내역 불러오기 */
@WebServlet({"/transfer", "/transfer-info", "/all-transfer-info"})
public class AccountTransferInfoRequestController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final OkHttpClient client = new OkHttpClient();
    private final Gson gson = new Gson();

    public AccountTransferInfoRequestController() {
        super();
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        String comPath = request.getContextPath();
        String command = uri.substring(comPath.length());
 
        if (command.equals("/transfer")) {
            String accountNumber1 = request.getParameter("accountNumber1");
            String bankCode1 = request.getParameter("bankCode1");
            String accountNumber2 = request.getParameter("accountNumber2");
            String bankCode2 = request.getParameter("bankCode2");
            int amount = Integer.parseInt(request.getParameter("amount"));
            String content = request.getParameter("content");
            System.out.println(accountNumber1);
            TransferInfo transferInfo = new TransferInfo(accountNumber1, bankCode1, accountNumber2, bankCode2, amount, content);
            
            Gson gson = new Gson();
            String jsonPayload = gson.toJson(transferInfo);
    
            URL url = new URL("http://15.164.234.117/openapi/transfer");
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
            if (responseCode == HttpURLConnection.HTTP_OK) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("PUT request succeeded.");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("PUT request failed. Response Code: " + responseCode);
            }
            connection.disconnect();
        }
    }


    // 특정 은행 계좌의 거래 내역 모두 조회
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String uri = req.getRequestURI();
        String comPath = req.getContextPath();
        String command = uri.substring(comPath.length());

        if (command.equals("/transfer-info")) {
            String accountNumber = req.getParameter("accountNumber");
            String bankCode = req.getParameter("bankCode");

            String url = "http://15.164.234.117/openapi/transfer-info?accountNumber="
                    + accountNumber + "&bankCode=" + bankCode;

            Request okHttpRequest = new Request.Builder().url(url).get().build();
            List<AccountTransferInfoDTO> accountTransferInfos = new ArrayList<>();
            try {
                Response okHttpResponse = client.newCall(okHttpRequest).execute();
                if (okHttpResponse.isSuccessful() && okHttpResponse.body() != null) {
                    Type listType = new TypeToken<ArrayList<AccountTransferInfoDTO>>() {}.getType();
                    accountTransferInfos = gson.fromJson(okHttpResponse.body().string(), listType);
                    // Account Information 출력
                    System.out.println("Account Information: " + accountTransferInfos);

                } else {
                    throw new IOException("Unexpected code " + okHttpResponse);
                }
            } catch (IOException e) {
                // 에러 메시지 출력
                System.out.println("Failed to get account information: " + e.getMessage());
                throw new ServletException("Failed to get account information", e);
            }

            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(gson.toJson(accountTransferInfos));
        }else if (command.equals("/all-transfer-info")) {
            String personalIdNumber = req.getParameter("personalIdNumber");
            // Base64를 통하여 입력받은 주민등록번호를 인코딩(보안 강화)
            String encodedIdNumber =
                    Base64.getEncoder().encodeToString(personalIdNumber.getBytes());

            String url = "http://15.164.234.117/openapi/all-transfer-info?personalIdNumber="
                    + encodedIdNumber;

            Request okHttpRequest = new Request.Builder().url(url).get().build();

            List<AccountTransferInfoDTO> accountTransferInfos = new ArrayList<>();

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
                        Type listType = new TypeToken<ArrayList<AccountTransferInfoDTO>>() {}.getType();
                        List<AccountTransferInfoDTO> bankAccountTransferInfos = gson.fromJson(bankResponse, listType);
                        if (bankAccountTransferInfos != null) {
                            accountTransferInfos.addAll(bankAccountTransferInfos);
                        }
                    }

                    System.out.println("Account Information: " + accountTransferInfos);
                } else {
                    throw new IOException("Unexpected code " + okHttpResponse);
                }
            } catch (IOException e) {
                System.out.println("Failed to get account information: " + e.getMessage());
                throw new ServletException("Failed to get account information", e);
            }

            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(gson.toJson(accountTransferInfos));
        }

    }

}
