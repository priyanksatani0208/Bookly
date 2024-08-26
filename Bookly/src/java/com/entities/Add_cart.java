
package com.entities;

public class Add_cart {
    
    private int cartId;
    private int uId;
    private int bookId;
    private int quantity;

    public Add_cart() {
    }

    public Add_cart(int cartId, int uId, int bookId, int quantity) {
        this.cartId = cartId;
        this.uId = uId;
        this.bookId = bookId;
        this.quantity = quantity;
    }

    public Add_cart(int uId, int bookId, int quantity) {
        this.uId = uId;
        this.bookId = bookId;
        this.quantity = quantity;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    
}
