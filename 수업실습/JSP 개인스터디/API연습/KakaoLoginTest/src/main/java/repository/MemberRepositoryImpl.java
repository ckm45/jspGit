package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import vo.MemberDTO;

public class MemberRepositoryImpl implements MemberRepository {

    private static MemberRepositoryImpl instance = null;

    private DataSource ds;

    public MemberRepositoryImpl() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static MemberRepositoryImpl getInstance() {
        if (instance == null) {
            synchronized (MemberRepositoryImpl.class) {
                if (instance == null) {
                    instance = new MemberRepositoryImpl();
                }
            }
        }
        return instance;
    }


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
            String query = "SELECT * FROM member_hana WHERE member_id = '" + uId + "'";
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

    @Override
    public void insertKaKaoMember(String id, String nickName, String email) {
        System.out.println("insert메소드 시작");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int memberStatus = 1; // 최초 로그인 시 상태값 정상
        String query = "INSERT INTO member_hana (member_id, name, email, member_status)\r\n"
                + "VALUES (?, ?, ?, ?)";

        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setString(2, nickName);
            pstmt.setString(3, email);
            pstmt.setInt(4, memberStatus);
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

    @Override
    public MemberDTO memberLoginCheck(String kakaoId) {
        System.out.println("카카오 login체크");
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        try {
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from member_hana where member_id = '" + kakaoId + "'");

            while (rs.next()) {
                String memberId = rs.getString("member_id");
                if (kakaoId.equals(memberId)) {
                    String name = rs.getString("name");
                    String userPassword = rs.getString("user_password");
                    String easyPassword = rs.getString("easy_password");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String personalIdNumber = rs.getString("personal_id_number");
                    String gender = rs.getString("gender");
                    String birth = rs.getString("birth");
                    String zipcode = rs.getString("zipcode");
                    String address = rs.getString("address");
                    String detailAddress = rs.getString("detail_address");
                    String regDate = rs.getString("reg_date");
                    int member_status = rs.getInt("member_status");
                    String withdrawalDate = rs.getString("withdrawal_date");


                    dto = new MemberDTO(memberId, name, userPassword, easyPassword, email, phone,
                            personalIdNumber, gender, birth, zipcode, address, detailAddress,
                            regDate, member_status, withdrawalDate);

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

    @Override
    public void kakaoJoin(String id, String simplePw, String phone, String personID, String gender,
            String birth, String zipcode, String address, String detailAddress) {
        System.out.println("update 시작 (카카오)");
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;

        try {
            conn = ds.getConnection();

            // SQL 쿼리 작성
            String sql =
                    "UPDATE member_hana SET easy_password = ? , phone = ?,  personal_id_number = ?, gender = ?, birth = ?, zipcode = ?, address = ?, detail_address = ?  WHERE member_id = ?";

            // PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);

            // 매개변수 값 설정
            pstmt.setString(1, simplePw);
            pstmt.setString(2, phone);
            pstmt.setString(3, personID);
            pstmt.setString(4, gender);
            pstmt.setString(5, birth);
            pstmt.setString(6, zipcode);
            pstmt.setString(7, address);
            pstmt.setString(8, detailAddress);
            pstmt.setString(9, id);

            // 쿼리 실행
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("update 성공");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


    }

    @Override
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

    // 회원가입시 주민등록번호 중복 체크
    public boolean personIdCheck(MemberDTO dto) {
        boolean ck = false;

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            System.out.println("if문 시작");
            conn = ds.getConnection();
            stmt = conn.createStatement();

            // 쿼리를 수정하여 조건에 맞는 회원을 가져옵니다.
            String query = "SELECT * FROM member_hana WHERE personal_id_number = '"
                    + dto.getPersonalIdNumber() + "'";
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


    @Override
    public void joinMember(MemberDTO dto) {
        System.out.println("insert메소드 시작");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query =
                "INSERT INTO member_hana (member_id, name, user_password, easy_password, email, phone, personal_id_number, gender, birth, zipcode, address, detail_address, member_status, withdrawal_date)\r\n"
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getMemberId());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getUserPassword());
            pstmt.setString(4, dto.getEasyPassword());
            pstmt.setString(5, dto.getEmail());
            pstmt.setString(6, dto.getPhone());
            pstmt.setString(7, dto.getPersonalIdNumber());
            pstmt.setString(8, dto.getGender());
            pstmt.setString(9, dto.getBirth());
            pstmt.setString(10, dto.getZipcode());
            pstmt.setString(11, dto.getAddress());
            pstmt.setString(12, dto.getDetailAddress());
            pstmt.setInt(13, dto.getMemberStatus());
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

    @Override
    public MemberDTO memberLoginCheck(String ckId, String ckPw) {
        boolean ck = false;
        System.out.println("일반 회원 login체크");
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        MemberDTO dto = null;
        try {
            conn = ds.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from member_hana where member_id = '" + ckId + "'");

            while (rs.next()) {
                String memberId = rs.getString("member_id");
                String userPassword = rs.getString("user_password");
                System.out.println("id: " + memberId + "|pw : " + userPassword);
                if (ckId.equals(memberId) && ckPw.equals(userPassword)) {
                    String name = rs.getString("name");
                    String easyPassword = rs.getString("easy_password");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String personalIdNumber = rs.getString("personal_id_number");
                    String gender = rs.getString("gender");
                    String birth = rs.getString("birth");
                    String zipcode = rs.getString("zipcode");
                    String address = rs.getString("address");
                    String detailAddress = rs.getString("detail_address");
                    String regDate = rs.getString("reg_date");
                    int member_status = rs.getInt("member_status");
                    String withdrawalDate = rs.getString("withdrawal_date");


                    ck = true;
                    dto = new MemberDTO(memberId, name, userPassword, easyPassword, email, phone,
                            personalIdNumber, gender, birth, zipcode, address, detailAddress,
                            regDate, member_status, withdrawalDate);

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

    // (은행API)주민등록번호로 회원 검색
    @Override
    public String findMemberIdByPersonalIdNumber(String personalIdNumber) {
        String result = "";
        String query = "SELECT member_id FROM member_hana WHERE personal_id_number = ?";
        Connection conn = null;
        try {
            conn = ds.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, personalIdNumber);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getString("member_id");
            }
        } catch (SQLException e) {
            System.out.println("Error while retrieving member_id");
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

}
