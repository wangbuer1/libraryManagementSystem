package main.dao.impl;

import main.dao.MybatisDao;
import main.dao.StudentDao;
import main.dao.domain.Student;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudentDaoImpl extends MybatisDao<Student> implements StudentDao {

    @Override
    public boolean save(Student bean) {
        return this.insert("StudentMapper.insert", bean);
    }

    @Override
    public boolean update(Student bean) {
        return this.insert("StudentMapper.update", bean);
    }

    @Override
    public boolean delete(Student bean) {
        return this.insert("StudentMapper.delete", bean);
    }

    @Override
    public List<Student> find(Student bean) {
        return this.queryForList("StudentMapper.select", bean);
    }

    @Override
    public Student findById(Student bean) {
        return this.queryForObject("StudentMapper.selectById", bean);
    }

    @Override
    public Student findBySno(Student bean) {
        return this.queryForObject("StudentMapper.selectBySno", bean);
    }

}
