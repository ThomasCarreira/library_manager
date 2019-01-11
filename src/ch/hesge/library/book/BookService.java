package ch.hesge.library.book;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Stateless
public class BookService {

    @PersistenceContext
    private EntityManager em;

    public void addBook(Book book){
        em.persist(book);
    }

    public void deleteBook(int id) {
        Book book = em.find(Book.class, id);
        em.remove(book);
    }

    public List<Book> getBooks() {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Book> cq = cb.createQuery(Book.class);
        Root<Book> book = cq.from(Book.class);
        TypedQuery<Book> q = em.createQuery(cq);
        List<Book> books = q.getResultList();

        return books;
    }

    public void modifyBook(int id, Book mBook) {
        Book book = em.find(Book.class, id);
        book.setAnnee(mBook.getAnnee());
        book.setTitre(mBook.getTitre());
        book.setAuteur(mBook.getAuteur());
        book.setEditeur(mBook.getEditeur());
    }
}
