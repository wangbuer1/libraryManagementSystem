package main.dao;


import main.dao.domain.Book;

import java.util.List;

public interface BookDao {

    boolean save(Book bean);

    boolean update(Book bean);

    boolean updateRemain(Book bean);

    boolean delete(Book bean);

    List<Book> find(Book bean);

    Book findById(Book bean);

    Book findByBno(Book bean);
}
