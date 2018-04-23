package com.lyf.service.imp;

import com.lyf.dao.GenericHibernateDAO;
import com.lyf.pojos.Organize;
import com.lyf.service.OrganizeService;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fangjiejie on 2018/4/16.
 */
@Service("organizeService")
public class OrganizeServiceImp extends GenericHibernateDAO implements OrganizeService {
    @Override
    public Organize queryOrganizeByOcode(String ocode) {
        Query query=this.createQuery("from Organize where ocode=:ocode");
        query.setString("ocode",ocode);
        List<Organize> list=query.list();
        if(list.size()!=0){
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<Organize> getOrganizeList() {
        Query query=this.createQuery("from Organize");
        List<Organize> list=query.list();
        return list;
    }

    @Override
    public Organize getOrganizeByOid(int oid) {
        return (Organize) this.getObjById(Organize.class,oid);
    }

    @Override
    public void updateOrganize(Organize organize) {
        this.update(organize);
    }
    @Override
    public void deleteOrganize(int oid){
        this.deleteByIds(Organize.class,oid);
    }

    @Override
    public void addOrganize(Organize organize) {
        this.save(organize);
    }
}
