package com.dao;

import com.entities.Contact;
import com.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Contactdao {

    private Connection con;

    public Contactdao(Connection con) {
        this.con = con;
    }

    // Method to fetch all Contact
    // In Contactdao.java
    public List<Contact> getContactsByPage(int start, int total) {
        List<Contact> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM contact LIMIT ?, ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, start);
            pstmt.setInt(2, total);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Contact contact = new Contact();
                contact.setContId(rs.getInt("contId"));
                contact.setContFname(rs.getString("contFname"));
                contact.setContLname(rs.getString("contLname"));
                contact.setContEmail(rs.getString("contEmail"));
                contact.setContPhone(rs.getInt("contPhone"));
                contact.setContMessage(rs.getString("contMessage"));
                list.add(contact);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getContactCount() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM contact";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

}
