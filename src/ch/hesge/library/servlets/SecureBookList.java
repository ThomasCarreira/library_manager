package ch.hesge.library.servlets;

import ch.hesge.library.services.BookService;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SecureBookList extends HttpServlet {
    @EJB
    BookService bookService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("books", bookService.getBooks());
        req.getRequestDispatcher("/WEB-INF/secureBookList.jsp").forward(req, resp);
    }
}
