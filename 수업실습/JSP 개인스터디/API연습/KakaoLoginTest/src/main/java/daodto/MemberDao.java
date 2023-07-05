package daodto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
    
    private DataSource ds;

    public MemberDao() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //회원가입 시 중복 아이디 검사
    public boolean checkId(String uId) {

            boolean ck = false;

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                    System.out.println("id중복체크 시작");
                    conn = ds.getConnection();
                    stmt = conn.createStatement();

                    // 쿼리를 수정하여 조건에 맞는 회원을 가져옵니다.
                    String query = "SELECT * FROM member_test WHERE user_id = '" + uId + "'";
                    rs = stmt.executeQuery(query);
                    
                    if (rs.next()) {
                        // 이미 해당 아이디가 존재하는 경우
                        System.out.println("join fail");
                    } else {
                        // 해당 아이디가 존재하지 않는 경우
                        ck = true;
                    }
                
            } catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            } finally {
                try {

                    if (rs != null)
                        rs.close();
                    if (stmt != null)
                        stmt.close();
                    if (conn != null)
                        conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            System.out.println(ck);
            return ck;
        }
        
    
    
    public void insertMember(long id, String nickName) {
        System.out.println("insert메소드 시작");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String query =
                "INSERT INTO KAKAOTEST (ID, NICKNAME)\r\n" + "VALUES (?, ?)";

        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setLong(1, id);
            pstmt.setString(2, nickName);
            int iResult = pstmt.executeUpdate();

            if (iResult >= 1) {
                System.out.println("insert success");

            } else {
                System.out.println("insert fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
    
    public String mailSend(String email) {
        String verificationCode = "";
        String host = "smtp.naver.com"; // 네이버 SMTP 서버
        String user = ".com"; // 네이버 계정
        String password = ""; // 네이버 계정 비밀번호

        // SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.naver.com");

        props.put("mail.smtp.ssl.protocols", "TLSv1.2");


        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

            // 메일 제목
            message.setSubject("SMTP TEST");

            // 인증 번호 생성
            verificationCode = generateVerificationCode();

            // 메일 내용에 인증 번호 추가
            String mailContent = "TEST MAIL \n인증 번호는 " + verificationCode + "입니다.";
            message.setText(mailContent);

            // 메일 전송
            Transport.send(message);
            System.out.println("Success Message Sent");

        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return verificationCode;
    }
    
    public String generateVerificationCode() {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();

        // 6자리의 난수 생성
        for (int i = 0; i < 6; i++) {
            int digit = random.nextInt(10);
            sb.append(digit);
        }

        return sb.toString();
    }
    
    public void joinMember(MemberDto dto) {
        
        System.out.println("insert메소드 시작");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String query =
                "INSERT INTO member_test (user_id, name, user_password, easy_password, email, phone, personal_id_number, gender, birth, zipcode, address, detail_address, account_status, withdrawal_date)\r\n" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getUserId());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getUserPw());
            pstmt.setString(4, dto.getSimplePw());
            pstmt.setString(5, dto.getEmail());
            pstmt.setString(6, dto.getPhone());
            pstmt.setString(7, dto.getPersonID());
            pstmt.setString(8, dto.getGender());
            pstmt.setString(9, dto.getBirth());
            pstmt.setString(10, dto.getZipcode());
            pstmt.setString(11, dto.getAddress());
            pstmt.setString(12, dto.getDetailAddress());
            pstmt.setString(13, dto.getAccountStatus());
            pstmt.setString(14, dto.getWithdrawalDate());
            int iResult = pstmt.executeUpdate();

            if (iResult >= 1) {
                System.out.println("insert success");

            } else {
                System.out.println("insert fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
    
    public MemberDto memberLoginCheck(String ckId, String ckPw) {
        boolean ck = false;
        System.out.println("login체크");
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        MemberDto dto = null;
        try {
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from member_test where user_id = '" + ckId + "'");
            
            while (rs.next()) {
                String uId = rs.getString("user_id");
                String pw = rs.getString("user_password");
                System.out.println("id: " + uId + "|pw : " + pw);
                if (ckId.equals(uId) && ckPw.equals(pw)) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String simplePw = rs.getString("easy_password");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String personId = rs.getString("personal_id_number");
                    String gender = rs.getString("gender");
                    String birth = rs.getString("birth");
                    String zipcode = rs.getString("zipcode");
                    String address = rs.getString("address");
                    String detailAddress= rs.getString("detail_address");
                    String regDate = rs.getString("reg_date");
                    String accountStatus = rs.getString("account_status");
                    String withdrawalDate = rs.getString("withdrawal_date");
                    
                    
                    ck = true;
                    dto = new MemberDto(id, uId, pw, name, simplePw, email,
                            phone, personId, gender, birth, zipcode, address, detailAddress, regDate, accountStatus, withdrawalDate);
                    
                } else {
                    System.out.println("login fail");
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dto;
    }

}
