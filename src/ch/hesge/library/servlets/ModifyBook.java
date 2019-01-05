package ch.hesge.library.servlets;

import ch.hesge.library.domaine.Book;
import ch.hesge.library.services.BookService;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ModifyBook extends HttpServlet {
    @EJB
    private BookService bookService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String titre = (String) req.getParameter("titre");
        String auteur = (String) req.getParameter("auteur");
        String editeur = (String) req.getParameter("editeur");
        String annee = (String) req.getParameter("annee");
        if (titre != "" && auteur != "" && editeur != "" && annee != ""){
            Book book = new Book(titre, auteur, editeur, annee);
            bookService.modifyBook(id, book);
            resp.sendRedirect("/secure/bookList");
        } else {
            req.setAttribute("error","Champ vide inacceptable !!!");
            req.getRequestDispatcher("/WEB-INF/secureBookList.jsp").forward(req,resp);
        }
    }
}
