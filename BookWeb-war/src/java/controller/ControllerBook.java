/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Beans.BookBeanLocal;
import Beans.CartBeanLocal;
import dto.Cart;
import entity.Book;
import entity.Order;
import entity.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dutran
 */
@WebServlet(name = "ControllerBook", urlPatterns = {"/ControllerBook"})
public class ControllerBook extends HttpServlet {

    @EJB
    private CartBeanLocal cartBean;

    @EJB
    private BookBeanLocal bookBean;

    int tongTien = 0;
    int stt = 0;
    Order order = new Order();
    List<OrderDetail> orderDetails = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        if (action == null) {
            request.setAttribute("books", bookBean.createDataBook());
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } else if (action.endsWith("AddCart")) {
            String id = request.getParameter("maSach");
            int numId = Integer.parseInt(id);
            Cart resCart = cartBean.getCart(numId);
            Book res = bookBean.getBook(numId);

            if (resCart != null) {
                tongTien -= resCart.getGiaBan() * resCart.getSoLuong();
                int num = resCart.getSoLuong();
                num++;
                resCart.setSoLuong(num);
                resCart.setTongTien(resCart.getGiaBan() * resCart.getSoLuong());
                tongTien += resCart.getGiaBan() * resCart.getSoLuong();
                response.sendRedirect("ControllerBook");
            } else {

                Cart cart = new Cart(res.getMaSach(), res.getTenSach(), 1, res.getImg(), res.getGiaBan());
                cart.setTongTien(cart.getGiaBan() * cart.getSoLuong());
                tongTien += cart.getGiaBan() * cart.getSoLuong();
                cartBean.addCart(cart);
                response.sendRedirect("ControllerBook");
            }

        } else if (action.equals("viewCart")) {
            request.setAttribute("carts", cartBean.getCartItem());
            request.setAttribute("total", tongTien);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else if (action.endsWith("RemoveFromCart")) {
            String id = request.getParameter("maSach");
            int numId = Integer.parseInt(id);
            Cart remove = cartBean.getCart(numId);
            tongTien -= remove.getGiaBan() * remove.getSoLuong();
            cartBean.removeCart(numId);
            response.sendRedirect("ControllerBook?action=viewCart");
        } else if (action.equals("PlaceOrder")) {
            List<Cart> cartItems = cartBean.getCartItem();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String money = request.getParameter("money");
            String paymentMethod = request.getParameter("paymentMethod");
            String cardNumber = request.getParameter("cardNumber");
            String expiryDate = request.getParameter("expiryDate");
            String cvv = request.getParameter("cvv");

            order.setMaOrder(++stt);
            order.setHoTen(name);
            order.setSdt(phone);
            order.setDiaChi(address);
            order.setTongTien(Integer.parseInt(money));
            order.setMethod(paymentMethod);
            order.setDate("29/03/2024");

           

            Iterator<Cart> iterator = cartItems.iterator();
            while (iterator.hasNext()) {
                Cart cart = iterator.next();
                OrderDetail orderDetail = new OrderDetail(stt, cart.getTenSach(), cart.getSoLuong(), cart.getGiaBan(), cart.getTongTien());
                orderDetails.add(orderDetail);
                iterator.remove();
                cartBean.removeCart(cart.getMaSach());
            }
            tongTien = 0;
            response.sendRedirect("ControllerBook?action=viewOrder");
        } else if (action.equals("viewOrder")) {
            request.setAttribute("order", order);
            request.setAttribute("orderDetails", orderDetails);
            request.getRequestDispatcher("order.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
