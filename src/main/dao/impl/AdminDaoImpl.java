package main.dao.impl;

import main.dao.AdminDao;
import main.dao.domain.Admin;
import main.dao.MybatisDao;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDaoImpl extends MybatisDao<Admin> implements AdminDao {

    @Override
    public boolean save(Admin bean) {
        return this.insert("AdminMapper.insert", bean);
    }

    @Override
    public boolean update(Admin bean) {
        return this.insert("AdminMapper.update", bean);
    }

    @Override
    public boolean delete(Admin bean) {
        System.out.println("到dao");
        return this.update("AdminMapper.delete", bean);
    }

    @Override
    public List<Admin> find(Admin bean) {
        return this.queryForList("AdminMapper.select", bean);
    }

    @Override
    public Admin findById(Admin bean) {
        return this.queryForObject("AdminMapper.selectById", bean);
    }

    @Override
    public Admin findByAno(Admin bean) {
        return this.queryForObject("AdminMapper.selectByAno", bean);
    }

}
