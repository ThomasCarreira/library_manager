package ch.hesge.library.servlets;

import ch.hesge.library.services.BookService;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteBook extends HttpServlet {
    @EJB
    BookService bookService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        bookService.deleteBook(Integer.parseInt(req.getParameter("id")));
        resp.sendRedirect(req.getContextPath()+"/secure/bookList");
    }
}
