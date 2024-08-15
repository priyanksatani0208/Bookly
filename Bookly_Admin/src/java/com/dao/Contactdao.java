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


     // Method to delete a Contact by ID
    public boolean deleteContact(int contId) {
        boolean deleted = false;
        try {
            String query = "DELETE FROM contact WHERE contId =?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, contId);
            ps.executeUpdate();
            deleted = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }
    
     //total Contatct method
    public int getTotalContact() {
        int totalContact = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM contact";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalContact = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalContact;
    }
}
