package daodto;

public class MemberDto {
    private int id;
    private String userId;
    private String userPw;
    private String name;
    private String simplePw;
    private String email;
    private String phone;
    private String personID;
    private String gender;
    private String birth;
    private String zipcode;
    private String address;
    private String detailAddress;
    private String regDate;
    private String accountStatus;
    private String withdrawalDate;
    
    public MemberDto(int id, String userId, String userPw, String name, String simplePw, String email,
            String phone, String personID, String gender, String birth, String zipcode,
            String address, String detailAddress, String regDate, String accountStatus,
            String withdrawalDate) {
    
        this.id = id;
        this.userId = userId;
        this.userPw = userPw;
        this.name = name;
        this.simplePw = simplePw;
        this.email = email;
        this.phone = phone;
        this.personID = personID;
        this.gender = gender;
        this.birth = birth;
        this.zipcode = zipcode;
        this.address = address;
        this.detailAddress = detailAddress;
        this.regDate = regDate;
        this.accountStatus = accountStatus;
        this.withdrawalDate = withdrawalDate;
    }
    
    

    public MemberDto(String userId, String userPw, String name, String simplePw, String email,
            String phone, String personID, String zipcode,
            String address, String detailAddress) {
        super();
        this.id = 0;
        this.userId = userId;
        this.userPw = userPw;
        this.name = name;
        this.simplePw = simplePw;
        this.email = email;
        this.phone = phone;
        this.personID = personID;
        this.gender = null;
        this.birth = null;
        this.zipcode = zipcode;
        this.address = address;
        this.detailAddress = detailAddress;
        this.regDate = null;
        this.accountStatus = "T";
        this.withdrawalDate = null;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSimplePw() {
        return simplePw;
    }

    public void setSimplePw(String simplePw) {
        this.simplePw = simplePw;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPersonID() {
        return personID;
    }

    public void setPersonID(String personID) {
        this.personID = personID;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(String accountStatus) {
        this.accountStatus = accountStatus;
    }

    public String getWithdrawalDate() {
        return withdrawalDate;
    }

    public void setWithdrawalDate(String withdrawalDate) {
        this.withdrawalDate = withdrawalDate;
    }
    
    
    
    
    
}
