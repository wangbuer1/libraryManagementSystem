package main.dao;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.dao.DataAccessException;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * MyBatis 基础DAO 封装
 * User: YinWei
 * Date: 2011-8-2
 * Time: 11:16:59
 */
public abstract class MybatisDao<T extends Object> extends SqlSessionDaoSupport {

    /**
     * 新增对象
     *
     * @param classMethod ： MyBatis xml 配置文件中的SQL - Key
     * @param entity      ： 需要进行新增的Bean对象
     * @return true ： 成功   false ： 失败
     * @throws DataAccessException
     */
    public boolean insert(String classMethod, T entity) throws DataAccessException {
        boolean flag = false;
        try {
            flag = this.getSqlSession().insert(classMethod, entity) > 0 ? true : false;
        } catch (DataAccessException e) {
            flag = false;
            throw e;
        }
        return flag;
    }

    /**
     * 更新数据
     *
     * @param classMethod ： MyBatis xml 配置文件中的SQL - Key
     * @param entity      ： 需要进行更新的Bean对象
     * @return true ： 成功   false ： 失败
     * @throws DataAccessException
     */
    public boolean update(String classMethod, T entity) throws DataAccessException {
        boolean flag = false;
        try {
            flag = this.getSqlSession().update(classMethod, entity) > 0 ? true : false;
        } catch (DataAccessException e) {
            flag = false;
            throw e;
        }
        return flag;
    }

    /**
     * 查询一条记录
     *
     * @param classMethod ： MyBatis xml 配置文件中的SQL - Key
     * @param entity      ： 查询参数对象，可以是自定义的查询对象
     * @return 返回一个对象
     * @throws DataAccessException
     */
    public Object queryCountForObject(String classMethod, Object entity) throws DataAccessException {
        Object result = null;
        try {
            result = (Object) this.getSqlSession().selectOne(classMethod, entity);
        } catch (DataAccessException e) {
            throw e;
        }
        return result;
    }

    @SuppressWarnings("unchecked")
    public T queryForObject(String classMethod, T entity) throws DataAccessException {
        T result = null;
        try {
            result = (T) this.getSqlSession().selectOne(classMethod, entity);
        } catch (DataAccessException e) {
            throw e;
        }
        return result;
    }


    /**
     * 查询一组记录
     *
     * @param classMethod ： MyBatis xml 配置文件中的SQL - Key
     * @param entity      查询参数对象，可以是自定义的查询对象
     * @return 返回一组对象
     * @throws DataAccessException
     */
    public List<T> queryForList(String classMethod, T entity) throws DataAccessException {
        List<T> result = new ArrayList<T>();
        try {
            result = this.getSqlSession().selectList(classMethod, entity);
        } catch (DataAccessException e) {
            throw e;
        }
        return result;
    }

    /**
     * 查询一组记录
     *
     * @param classMethod ： MyBatis xml 配置文件中的SQL - Key
     * @return 返回一组对象
     * @throws DataAccessException
     */
    public List<T> queryForList(String classMethod) throws DataAccessException {
        List<T> result;
        try {
            result = this.getSqlSession().selectList(classMethod);
        } catch (DataAccessException e) {
            throw e;
        }
        return result;
    }

    public <K, V> Map<K, V> queryForMap(String classMethod, T entity, String mapKey) {
        Map<K, V> result;
        try {
            result = this.getSqlSession().selectMap(classMethod, entity, mapKey);
        } catch (DataAccessException e) {
            throw e;
        }
        return result;
    }

    /**
     * 删除记录
     *
     * @param classMethod : MyBatis xml 配置文件中的SQL - Key
     * @param entity      可以传入需要删除的记录对象,也可以只传入一个ID字段，可以根据SQL语句自行组合
     * @return ： 成功   false ： 失败
     * @throws Exception
     */
    public boolean delete(String classMethod, T entity) throws DataAccessException {
        boolean flag = false;
        try {
            flag = this.getSqlSession().delete(classMethod, entity) > 0 ? true : false;
        } catch (DataAccessException e) {
            flag = false;
            throw e;
        }
        return flag;
    }

    public List<T> selectList(String statement, Object parameter, int offset, int limit) {
        return this.getSqlSession().selectList(statement, parameter, new RowBounds(offset, limit));
    }
}
