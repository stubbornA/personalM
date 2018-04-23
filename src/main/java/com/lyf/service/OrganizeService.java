package com.lyf.service;

import com.lyf.pojos.Organize;

import java.util.List;

/**
 * Created by fangjiejie on 2018/4/16.
 */
public interface OrganizeService {
    public Organize queryOrganizeByOcode(String oid);
    public List<Organize> getOrganizeList();
    public Organize getOrganizeByOid(int oid);
    public void updateOrganize(Organize organize);
    public void deleteOrganize(int oid);
    public void addOrganize(Organize organize);
}
