/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/StatelessEjbClass.java to edit this template
 */
package Beans;

import entity.Book;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;

/**
 *
 * @author dutran
 */
@Stateless
public class BookBean implements BookBeanLocal {

   
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    @Override
    public List<Book> createDataBook() {
        List<Book> books = new ArrayList<>();
        books.add(new Book(1, "Life of Pi", "imgs\\lifeofpi.jpg", 15, 20));
        books.add(new Book(2, "The Alchemist", "imgs\\nhagiakim.jpg", 20, 50));
        books.add(new Book(3, "Harry Potter", "imgs\\harrypotter.jpg", 100, 100));
        books.add(new Book(4, "The Godfather", "imgs\\godfather.jpg", 99, 30));
        books.add(new Book(5, "To Kill A Mockingbird", "imgs\\killamoking.jpg", 16, 40));
        books.add(new Book(6, "Peter Pan", "imgs\\peterpan.jpg", 9, 15));
        books.add(new Book(7, "The Little Prince", "imgs\\thelittle.jpg", 6, 40));
        books.add(new Book(8, "Me Before You", "imgs\\jojo.jpg", 1, 25));
        return books;
    }
    


    @Override
    public Book getBook(int id) {
        Book book = null;
        for(Book i : createDataBook()) {
            if (i.getMaSach() == id) {
                book = i;
                break;
            }
        }
        return book;
    }

    

   
    
    
}
