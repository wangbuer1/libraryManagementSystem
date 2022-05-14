package main.dao.impl;

import main.dao.MybatisDao;
import main.dao.BookDao;
import main.dao.domain.Book;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDaoImpl extends MybatisDao<Book> implements BookDao {

    @Override
    public boolean save(Book bean) {
        return this.insert("BookMapper.insert", bean);
    }

    @Override
    public boolean update(Book bean) {
        return this.insert("BookMapper.update", bean);
    }

    @Override
    public boolean updateRemain(Book bean) {
        return this.insert("BookMapper.updateRemain", bean);
    }

    @Override
    public boolean delete(Book bean) {
        return this.insert("BookMapper.delete", bean);
    }

    @Override
    public List<Book> find(Book bean) {
        return this.queryForList("BookMapper.select", bean);
    }

    @Override
    public Book findById(Book bean) {
        return this.queryForObject("BookMapper.selectById", bean);
    }

    @Override
    public Book findByBno(Book bean) {
        return this.queryForObject("BookMapper.selectByBno", bean);
    }

}
