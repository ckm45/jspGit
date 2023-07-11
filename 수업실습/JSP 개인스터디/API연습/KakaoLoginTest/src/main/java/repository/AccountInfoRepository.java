package repository;

import vo.AccountInfoDTO;

public interface AccountInfoRepository {
    
    //계좌개설
    public void insertAccount(AccountInfoDTO dto);
    

}
