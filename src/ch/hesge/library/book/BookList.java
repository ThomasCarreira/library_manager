package ch.hesge.library.book;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BookList extends HttpServlet {
    @EJB
    BookService bookService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String titre = req.getParameter("notification");
        req.getRequestDispatcher("/WEB-INF/navbar.jsp").include(req, resp);
        if(titre != null) {
            if (titre.equals("added")){
                req.getRequestDispatcher("/WEB-INF/notifications/addedBook.jsp").include(req,resp);
            } else if (titre.equals("empty")) {
                req.getRequestDispatcher("/WEB-INF/notifications/emptyField.jsp").include(req,resp);
            } else if (titre.equals("modified")) {
                req.getRequestDispatcher("/WEB-INF/notifications/modifiedBook.jsp").include(req,resp);
            } else if (titre.equals("deleted")){
                req.getRequestDispatcher("/WEB-INF/notifications/deletedBook.jsp").include(req,resp);
            }
        }
        req.setAttribute("books", bookService.getBooks());
        req.getRequestDispatcher("/WEB-INF/bookList.jsp").include(req, resp);
    }
}
