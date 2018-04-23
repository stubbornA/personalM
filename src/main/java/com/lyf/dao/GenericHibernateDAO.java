package com.lyf.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.io.Serializable;

/**
 * Created by admin on 2018/4/10.
 */
@Transactional
public class GenericHibernateDAO<PK extends Serializable> {
    @Autowired
    @Qualifier(("sessionFactory"))
    private SessionFactory sessionFactory;
    public Session getSession() {
        //事务必须开启（Required） 否则获取不到
        return sessionFactory.getCurrentSession();
    }
    /**
     * 存储数据
     * @param model
     * @return
     */
    public Serializable save(Object model) {
        return getSession().save(model);
    }

    /**
     * 删除
     * @param model
     */
    public void delete(Object model) {
        getSession().delete(model);
    }

    /**
     * 修改
     * @param  model
     */
    public void update(Object model) {
        getSession().update(model);
    }

    public void deleteByIds(Class model,PK...id){
        for(int i=0;i<id.length;i++){
            getSession().delete(getObjById(model, id[i]));
        }
    }

    /**
     * 通过ID获取对象
     * @param model
     * @param id
     */
    public Object getObjById(Class model,PK id){
        return getSession().get(model, id);
    }
    /**
     * 创建Query对象.
     * 对于first,max,fetchsize,cache,cacheRegion等诸多设置的函数,可以在返回Query后自行设�?
     * 留意可以连续设置,如下�?
     *
     * <pre>
     * dao.createQuery(hql).setMaxResult(100).setCacheable(true).list();
     * </pre>
     *
     * 调用方式如下:
     *
     * <pre>
     *        dao.createQuery(hql)
     *        dao.createQuery(hql,arg0);
     *        dao.createQuery(hql,arg0,arg1);
     *        dao.createQuery(hql,new Object[arg0,arg1,arg2])
     * </pre>
     *
     * @param values
     *            可变参数.
     * @return org.hibernate.Query
     */
    public Query createQuery(String hql, Object... values) {
        Assert.hasText(hql);
        Query query = getSession().createQuery(hql);
        for (int i = 0; i < values.length; i++) {
            query.setParameter(i, values[i]);
        }
        return query;
    }
 }
