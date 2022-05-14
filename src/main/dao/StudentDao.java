package main.dao;


import main.dao.domain.Student;

import java.util.List;

public interface StudentDao {

    boolean save(Student bean);

    boolean update(Student bean);

    boolean delete(Student bean);

    List<Student> find(Student bean);

    Student findById(Student bean);

    Student findBySno(Student bean);
}
