package main.dao.impl;

import main.dao.MybatisDao;
import main.dao.BookStudentDao;
import main.dao.domain.BookStudent;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookStudentDaoImpl extends MybatisDao<BookStudent> implements BookStudentDao {

    @Override
    public boolean save(BookStudent bean) {
        return this.insert("BookStudentMapper.insert", bean);
    }
    
    @Override
    public boolean saveYy(BookStudent bean) {
        return this.insert("BookStudentMapper.insertYy", bean);
    }

    @Override
    public boolean delete(BookStudent bean) {
        return this.insert("BookStudentMapper.delete", bean);
    }

    @Override
    public List<BookStudent> find(BookStudent bean) {
        return this.queryForList("BookStudentMapper.select", bean);
    }
    
    @Override
    public List<BookStudent> findYy(BookStudent bean) {
        return this.queryForList("BookStudentMapper.selectYy", bean);
    }

}
