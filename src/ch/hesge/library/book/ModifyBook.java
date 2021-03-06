package ch.hesge.library.book;

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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("id") == null){
            req.getRequestDispatcher("/WEB-INF/errorPages/404.jsp").forward(req, resp);
        }
    }

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
            resp.sendRedirect(req.getContextPath()+"/bookList?notification=modified");
        } else {
            resp.sendRedirect(req.getContextPath() + "/bookList?notification=empty");
        }
    }
}
