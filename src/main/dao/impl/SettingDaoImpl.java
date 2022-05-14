package main.dao.impl;

import main.dao.SettingDao;
import main.dao.domain.Setting;
import main.dao.MybatisDao;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SettingDaoImpl extends MybatisDao<Setting> implements SettingDao {


    @Override
    public boolean update(Setting bean) {
        return this.insert("SettingMapper.update", bean);
    }

    @Override
    public List<Setting> find(Setting bean) {
        return this.queryForList("SettingMapper.select", bean);
    }

    @Override
    public Setting findById(Setting bean) {
        return this.queryForObject("SettingMapper.selectById", bean);
    }
}
