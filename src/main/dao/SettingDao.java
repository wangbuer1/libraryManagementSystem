package main.dao;


import main.dao.domain.Setting;

import java.util.List;

public interface SettingDao {

    boolean update(Setting bean);

    List<Setting> find(Setting bean);

    Setting findById(Setting bean);

}
