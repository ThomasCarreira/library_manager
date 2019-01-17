package ch.hesge.library.book;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NewBook extends HttpServlet {
    @EJB
    private BookService bookService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/navbar.jsp").include(req, resp);
        req.getRequestDispatcher("/WEB-INF/newBook.jsp").include(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String titre = (String) req.getParameter("titre");
        String auteur = (String) req.getParameter("auteur");
        String editeur = (String) req.getParameter("editeur");
        String annee = (String) req.getParameter("annee");
        if (titre != "" && auteur != "" && editeur != "" && annee != ""){
            Book book = new Book(titre, auteur, editeur, annee);
            bookService.addBook(book);
            resp.sendRedirect(req.getContextPath()+"/bookList?notification=added");
        } else {
            req.getRequestDispatcher("/WEB-INF/navbar.jsp").include(req, resp);
            req.getRequestDispatcher("/WEB-INF/notifications/emptyField.jsp").include(req, resp);
            req.getRequestDispatcher("/WEB-INF/newBook.jsp").include(req,resp);
        }
    }
}
