/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author dutran
 */
public class Book {
    private int maSach;
    private String tenSach;
    private String img;
    private int soLuong;
//    private String moTa;
    private int giaBan;

    public Book(int maSach, String tenSach, String img, int soLuong, int giaBan) {
        this.maSach = maSach;
        this.tenSach = tenSach;
        this.img = img;
        this.soLuong = soLuong;
        this.giaBan = giaBan;
    }

    

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    
    
    public int getMaSach() {
        return maSach;
    }

    public void setMaSach(int maSach) {
        this.maSach = maSach;
    }

    public String getTenSach() {
        return tenSach;
    }

    public void setTenSach(String tenSach) {
        this.tenSach = tenSach;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }


  
    public int getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(int giaBan) {
        this.giaBan = giaBan;
    }
    
    
}
