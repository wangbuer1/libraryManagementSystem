package main.dao.impl;

import main.dao.BookTypeDao;
import main.dao.domain.BookType;
import main.dao.MybatisDao;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookTypeDaoImpl extends MybatisDao<BookType> implements BookTypeDao {

    @Override
    public boolean save(BookType bean) {
        return this.insert("BookTypeMapper.insert", bean);
    }

    @Override
    public boolean update(BookType bean) {
        return this.update("BookTypeMapper.update", bean);
    }

    @Override
    public boolean delete(BookType bean) {
        return this.insert("BookTypeMapper.delete", bean);
    }

    @Override
    public List<BookType> find(BookType bean) {
        return this.queryForList("BookTypeMapper.select", bean);
    }

}
