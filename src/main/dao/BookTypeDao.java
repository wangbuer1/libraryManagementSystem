package main.dao;


import main.dao.domain.BookType;

import java.util.List;

public interface BookTypeDao {

    boolean save(BookType bean);

    boolean update(BookType bean);

    boolean delete(BookType bean);

    List<BookType> find(BookType bean);

}
