package com.helper;

import java.sql.*;


public class ConnectionProvider 
{
    private static Connection con;
    
    public static Connection getConnection()
    {
    
        try
        {
            if(con == null)
            {
                //  Load driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                //connection database

                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookly", "root", "");
            
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
                
        return con;
    }

    public Statement createStatement() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
