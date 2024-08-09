package com.entities;

public class Category {
    private int catId;
    private String catName;
    private String catImg;

    public Category(int catId, String catName, String catImg) {
        this.catId = catId;
        this.catName = catName;
        this.catImg = catImg;
    }

    public Category() {
    }

    public Category(String catName, String catImg) {
        this.catName = catName;
        this.catImg = catImg;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public String getCatImg() {
        return catImg;
    }

    public void setCatImg(String catImg) {
        this.catImg = catImg;
    }
        
}
