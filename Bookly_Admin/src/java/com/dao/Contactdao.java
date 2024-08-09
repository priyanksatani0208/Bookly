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
    public List<Contact> getAllContacts()
    {
        List<Contact> contacts = new ArrayList<>();
        try {
            String query = "SELECT * FROM contact";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int contid = rs.getInt("contId");
                String contFname = rs.getString("contFname");
                String contLname = rs.getString("contLname");
                String contEmail = rs.getString("contEmail");
                int contPhone = rs.getInt("contPhone");
                String contMessage = rs.getString("contMessage");

                Contact contact = new Contact(contid, contFname, contLname, contEmail, contPhone, contMessage);
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contacts;
    }
    
}
