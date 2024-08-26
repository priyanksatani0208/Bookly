package com.dao;

import com.entities.Add_cart;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Add_cartdao {
    
    private final Connection con;

    public Add_cartdao(Connection con) {
        this.con = con;
    }
    
   public boolean addOrUpdateBookInCart(int userId, int bookId) {
        boolean result = false;

        try {
            // Check if the book already exists in the cart for the user
            String checkQuery = "SELECT quantity FROM add_cart WHERE uId = ? AND bookId = ?";
            PreparedStatement checkStmt = con.prepareStatement(checkQuery);
            checkStmt.setInt(1, userId);
            checkStmt.setInt(2, bookId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Book already in cart, update quantity
                int currentQuantity = rs.getInt("quantity");
                String updateQuery = "UPDATE add_cart SET quantity = ? WHERE uId = ? AND bookId = ?";
                PreparedStatement updateStmt = con.prepareStatement(updateQuery);
                updateStmt.setInt(1, currentQuantity + 1); // Increment quantity
                updateStmt.setInt(2, userId);
                updateStmt.setInt(3, bookId);
                result = updateStmt.executeUpdate() > 0;
            } else {
                // Book not in cart, add new entry
                String insertQuery = "INSERT INTO add_cart (uId, bookId, quantity) VALUES (?, ?, ?)";
                PreparedStatement insertStmt = con.prepareStatement(insertQuery);
                insertStmt.setInt(1, userId);
                insertStmt.setInt(2, bookId);
                insertStmt.setInt(3, 1); // Initial quantity
                result = insertStmt.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    
     public List<Add_cart> getCartItems(int userId) {
        List<Add_cart> cartItems = new ArrayList<>();
        try {
            String query = "SELECT * FROM add_cart WHERE uId = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Add_cart cartItem = new Add_cart(
                        rs.getInt("cartId"),
                        rs.getInt("uId"),
                        rs.getInt("bookId"),
                        rs.getInt("quantity")
                );
                cartItems.add(cartItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }
     
     
      public boolean removeCartItem(int cartId) {
        boolean success = false;
        try {
            String query = "DELETE FROM add_cart WHERE cartId = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, cartId);
            int rowCount = pstmt.executeUpdate();
            success = rowCount > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
      
      public boolean updateCartItemQuantity(int cartId, int quantity) {
    try {
        String query = "UPDATE add_cart SET quantity = ? WHERE cartId = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, quantity);
        ps.setInt(2, cartId);
        
        int result = ps.executeUpdate();
        return result > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

}
