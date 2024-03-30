/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/SessionLocal.java to edit this template
 */
package Beans;

import java.util.List;
import javax.ejb.Local;
import entity.Book;
/**
 *
 * @author dutran
 */
@Local
public interface BookBeanLocal {
    List<Book> createDataBook();
    Book getBook(int id);
}
