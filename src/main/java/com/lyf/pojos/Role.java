package com.lyf.pojos;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by fangjiejie on 2018/4/17.
 */
@Entity
public class Role {
    private int rid;
    private String rname;
    private String rdescribe;

    @Id
    @Column(name = "rid")
    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    @Basic
    @Column(name = "rname")
    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    @Basic
    @Column(name = "rdescribe")
    public String getRdescribe() {
        return rdescribe;
    }

    public void setRdescribe(String rdescribe) {
        this.rdescribe = rdescribe;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Role role = (Role) o;

        if (rid != role.rid) return false;
        if (rname != null ? !rname.equals(role.rname) : role.rname != null) return false;
        if (rdescribe != null ? !rdescribe.equals(role.rdescribe) : role.rdescribe != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = rid;
        result = 31 * result + (rname != null ? rname.hashCode() : 0);
        result = 31 * result + (rdescribe != null ? rdescribe.hashCode() : 0);
        return result;
    }
}
