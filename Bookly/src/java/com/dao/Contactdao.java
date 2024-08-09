package com.dao;

import com.entities.Contact;
import java.sql.*;

public class Contactdao {

    private Connection con;

    public Contactdao(Connection con) {
        this.con = con;
    }
    
    public boolean addcontact(Contact contact)
    {
        boolean f = false;
        
        try
        {
            String qry = "insert into contact(contFname,contLname,contEmail,contPhone,contMessage) values(?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(qry);
            
            ps.setString(1, contact.getContFname());
            ps.setString(2, contact.getContLname());
            ps.setString(3, contact.getContEmail());
            ps.setInt(4, contact.getContPhone());
            ps.setString(5, contact.getContMessage());
            
            ps.executeUpdate();
                        
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
}
