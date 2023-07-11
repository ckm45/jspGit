package service;

import vo.AccountInfoDTO;

public interface AccountService {
    
    //계좌개설
    public void insertAccount(AccountInfoDTO dto);
    
}
