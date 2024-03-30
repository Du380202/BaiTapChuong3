/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/SessionLocal.java to edit this template
 */
package Beans;

import dto.Cart;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author dutran
 */
@Local
public interface CartBeanLocal {
    public void addCart(Cart cart) ;
    public void removeCart(int id);
    public List<Cart> getCartItem();
    public Cart getCart(int id) ;
    public int tongTien(Cart cart);
    
}
