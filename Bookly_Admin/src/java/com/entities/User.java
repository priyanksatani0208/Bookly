package com.entities;

public class User {
    private int uId;
    private String UName;
    private String uemail;
    private int uPhone;
    private String ugender;
    private String uAddress;
    private String uabout;
    private String uProfile;
    private String upassword;

   public User() {
    }

    public User(int uId, String UName, String uemail,int uPhone ,String ugender, String uAddress, String uabout, String uProfile, String upassword) {
        this.uId = uId;
        this.UName = UName;
        this.uemail = uemail;
        this.uPhone = uPhone;
        this.ugender = ugender;
        this.uAddress = uAddress;
        this.uabout = uabout;
        this.uProfile = uProfile;
        this.upassword = upassword;
    }

    public User(String uemail, String upassword) {
        this.uemail = uemail;
        this.upassword = upassword;
    }

    
    public User(String UName, String uemail,int uPhone, String ugender, String uAddress, String uabout, String uProfile, String upassword) {
        this.UName = UName;
        this.uemail = uemail;
        this.uPhone = uPhone;
        this.ugender = ugender;
        this.uAddress = uAddress;
        this.uabout = uabout;
        this.uProfile = uProfile;
        this.upassword = upassword;
    }

    
    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getUName() {
        return UName;
    }

    public void setUName(String UName) {
        this.UName = UName;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public int getuPhone() {
        return uPhone;
    }

    public void setuPhone(int uPhone) {
        this.uPhone = uPhone;
    }
    

    public String getUgender() {
        return ugender;
    }

    public void setUgender(String ugender) {
        this.ugender = ugender;
    }

    public String getuAddress() {
        return uAddress;
    }

    public void setuAddress(String uAddress) {
        this.uAddress = uAddress;
    }

    public String getUabout() {
        return uabout;
    }

    public void setUabout(String uabout) {
        this.uabout = uabout;
    }

    public String getuProfile() {
        return uProfile;
    }

    public void setuProfile(String uProfile) {
        this.uProfile = uProfile;
    }
   
    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }
    
    
}


