package service;

import java.util.Date;
import java.util.Random;
import repository.AccountInfoRepository;
import repository.AccountInfoRepositoryImpl;
import vo.AccountInfoDTO;

public class AccountServiceImpl implements AccountService {

    @Override
    public void insertAccount(String memberId, String productName, String bankCode, String nickname, String accountPassword) {
        
        String accountNumber = "001" + "-" + getRandomNumber() + "-" + getRandomNumber();
        bankCode = "KEB";
        String branchCode = "001";
        int balance = 0;
        int productId = 0;
        int accountStatus = 1;
        int openBankingStatus = 0;
        Date regDate = null;
        
        if(productName.equals("입출금상품A")) {
            productId = 100;
        }else if(productName.equals("입출금상품B")) {
            productId = 101;            
        }else if(productName.equals("예금상품A")) {
            productId = 200;           
        }else if(productName.equals("예금상품B")) {
            productId = 201;
        }else if(productName.equals("적금상품A")) {
            productId = 300;
        }else if(productName.equals("적금상품B")) {
            productId = 301;
        }
        
            
        
        AccountInfoDTO dto = new AccountInfoDTO(accountNumber, memberId, bankCode, branchCode, accountPassword, balance, nickname, productId,accountStatus, openBankingStatus, regDate);
        AccountInfoRepository repository = AccountInfoRepositoryImpl.getInstance();
        repository.insertAccount(dto);

    }
    private String getRandomNumber() {
        Random random = new Random();
        return Integer.toString(random.nextInt(9000));
     }
}
