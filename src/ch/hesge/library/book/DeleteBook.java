package ch.hesge.library.book;

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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("id") == null){
            req.getRequestDispatcher("/WEB-INF/errorPages/404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        bookService.deleteBook(Integer.parseInt(req.getParameter("id")));
        resp.sendRedirect(req.getContextPath()+"/bookList?notification=deleted");
    }
}
