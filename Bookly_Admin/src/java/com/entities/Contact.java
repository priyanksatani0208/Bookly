
package com.entities;

public class Contact {
    private int  contId ;
    private String contFname;
    private String contLname;
    private String contEmail;
    private int contPhone;
    private String contMessage ;

    public Contact() {
    }

    public Contact(int contId, String contFname, String contLname, String contEmail, int contPhone, String contMessage) {
        this.contId = contId;
        this.contFname = contFname;
        this.contLname = contLname;
        this.contEmail = contEmail;
        this.contPhone = contPhone;
        this.contMessage = contMessage;
    }

    public Contact(String contFname, String contLname, String contEmail, int contPhone, String contMessage) {
        this.contFname = contFname;
        this.contLname = contLname;
        this.contEmail = contEmail;
        this.contPhone = contPhone;
        this.contMessage = contMessage;
    }

    public int getContId() {
        return contId;
    }

    public void setContId(int contId) {
        this.contId = contId;
    }

    public String getContFname() {
        return contFname;
    }

    public void setContFname(String contFname) {
        this.contFname = contFname;
    }

    public String getContLname() {
        return contLname;
    }

    public void setContLname(String contLname) {
        this.contLname = contLname;
    }

    public String getContEmail() {
        return contEmail;
    }

    public void setContEmail(String contEmail) {
        this.contEmail = contEmail;
    }

    public int getContPhone() {
        return contPhone;
    }

    public void setContPhone(int contPhone) {
        this.contPhone = contPhone;
    }

    public String getContMessage() {
        return contMessage;
    }

    public void setContMessage(String contMessage) {
        this.contMessage = contMessage;
    }
    
    
    
}
