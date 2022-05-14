package main.dao;


import main.dao.domain.Admin;

import java.util.List;

public interface AdminDao {

    boolean save(Admin bean);

    boolean update(Admin bean);

    boolean delete(Admin bean);

    List<Admin> find(Admin bean);

    Admin findById(Admin bean);

    Admin findByAno(Admin bean);
}
