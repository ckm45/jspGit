package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import vo.AccountInfoDTO;

public class AccountInfoRepositoryImpl implements AccountInfoRepository{
    
    private static AccountInfoRepositoryImpl instance = null;
    
    private DataSource ds;
    
    public AccountInfoRepositoryImpl() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
    } 
    
    public static AccountInfoRepositoryImpl getInstance() {
        if (instance == null) {
            synchronized (AccountInfoRepositoryImpl.class) {
                if (instance == null) {
                    instance = new AccountInfoRepositoryImpl();
                }
            }
        }
        return instance;
    }
    
    @Override
    public void insertAccount(AccountInfoDTO dto) {
        
        System.out.println("insert메소드 시작");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query =
                "INSERT INTO account_info_hana (account_number, member_id, bank_code, branch_code, account_password, balance, nickname, product_id, account_status, open_banking_registered_yn)\r\n"
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            // conn = DriverManager.getConnection(url, uid, upw);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getAccountNumber());
            pstmt.setString(2, dto.getMemberId());
            pstmt.setString(3, dto.getBankCode());
            pstmt.setString(4, dto.getBranchCode());
            pstmt.setString(5, dto.getAccountPassword());
            pstmt.setInt(6, dto.getBalance());
            pstmt.setString(7, dto.getNickname());
            pstmt.setInt(8, dto.getProductId());
            pstmt.setInt(9, dto.getAccountStatus());
            pstmt.setInt(10, dto.getOpenBankingStatus());
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
    

}
