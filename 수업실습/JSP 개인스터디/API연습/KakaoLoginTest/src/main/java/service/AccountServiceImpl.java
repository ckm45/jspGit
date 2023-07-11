package service;

import repository.AccountInfoRepository;
import repository.AccountInfoRepositoryImpl;
import vo.AccountInfoDTO;

public class AccountServiceImpl implements AccountService {

    @Override
    public void insertAccount(AccountInfoDTO dto) {
        
        AccountInfoRepository repository = AccountInfoRepositoryImpl.getInstance();
        repository.insertAccount(dto);

    }

}
