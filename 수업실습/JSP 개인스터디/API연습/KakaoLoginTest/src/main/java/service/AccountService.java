package service;

import vo.AccountInfoDTO;

public interface AccountService {
    
    //계좌개설
    public void insertAccount(String memberId, String productName, String bankCode, String nickname, String accountPassword );
    
}
