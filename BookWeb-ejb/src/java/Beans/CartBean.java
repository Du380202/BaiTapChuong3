/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/StatefulEjbClass.java to edit this template
 */
package Beans;

import dto.Cart;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.ejb.Stateful;

/**
 *
 * @author dutran
 */
@Stateful
public class CartBean implements CartBeanLocal {

    List<Cart> cartItem = null;

    public CartBean() {
        cartItem = new ArrayList<>();
    }

    @Override
    public void addCart(Cart cart) {
        cartItem.add(cart);
    }

    @Override
    public List<Cart> getCartItem() {
        return cartItem;
    }

    @Override
    public void removeCart(int id) {
        for (Iterator<Cart> iterator = cartItem.iterator(); iterator.hasNext();) {
            Cart cart = iterator.next();
            if (cart.getMaSach() == id) {
                iterator.remove(); 
            }
        }
    }

    @Override
    public Cart getCart(int id) {
        Cart cart = null;
        for(Cart c : getCartItem()) {
            if (c.getMaSach()== id) {
                cart = c;
                break;
            }
        }
        return cart;
    }

    @Override
    public int tongTien(Cart cart) {
        int tong = cart.getGiaBan() * cart.getSoLuong();
        return tong;
    }

    
   

}
