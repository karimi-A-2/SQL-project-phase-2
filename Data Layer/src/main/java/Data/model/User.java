package Data.model;

public class User {
    private int id;
    private String phone;
    private String code;
    private String fname;
    private String lname;
    private String passWord;
    private int invitation;
    private boolean isLogedIn;

    public User(int id, String phone, String code, String fname, String lname, String passWord, boolean isLogedIn) {
        this.id = id;
        this.phone = phone;
        this.code = code;
        this.fname = fname;
        this.lname = lname;
        this.passWord = passWord;
        invitation = 10;
        this.isLogedIn = isLogedIn;
    }

    public User(int id, String phone, String fname, String lname, String passWord, int invitation, boolean isLogedIn) {
        this.id = id;
        this.phone = phone;
        this.fname = fname;
        this.lname = lname;
        this.passWord = passWord;
        this.invitation = invitation;
        this.isLogedIn = isLogedIn;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getInvitation() {
        return invitation;
    }

    public void setInvitation(int invitation) {
        this.invitation = invitation;
    }

    public boolean isLogedIn() {
        return isLogedIn;
    }

    public void setLogedIn(boolean logedIn) {
        isLogedIn = logedIn;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", phone='" + phone + '\'' +
                ", fname='" + fname + '\'' +
                ", lname='" + lname + '\'' +
                ", passWord='" + passWord + '\'' +
                '}';
    }
}
