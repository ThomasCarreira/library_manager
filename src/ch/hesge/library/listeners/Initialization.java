package ch.hesge.library.listeners;

import ch.hesge.library.domaine.Book;
import ch.hesge.library.services.BookService;

import javax.ejb.EJB;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class Initialization implements ServletContextListener {
    @EJB
    private BookService bookService;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        bookService.addBook(new Book("Tyrion & Teclis", "William King", "BLACK LIBRARY", "2018"));
        bookService.addBook(new Book("Spear of Shadows", "Josh Reynolds", "BLACK LIBRARY", "2018"));
        bookService.addBook(new Book("Rise of the Ynnari: Ghost Warrior", "Gav Thorpe", "BLACK LIBRARY", "2018"));
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {}
}
