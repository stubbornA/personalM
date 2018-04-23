package com.lyf.pojos;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by fangjiejie on 2018/4/16.
 */
@Entity
public class Organize {
    private int oid;
    private String oname;
    private String director;
    private String phone;
    private String adress;
    private int pnumber;
    private String email;
    private String orgnote;
    private String ocode;

    @Id
    @Column(name = "oid")
    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    @Basic
    @Column(name = "oname")
    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    @Basic
    @Column(name = "director")
    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "adress")
    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    @Basic
    @Column(name = "pnumber")
    public int getPnumber() {
        return pnumber;
    }

    public void setPnumber(int pnumber) {
        this.pnumber = pnumber;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "orgnote")
    public String getOrgnote() {
        return orgnote;
    }

    public void setOrgnote(String orgnote) {
        this.orgnote = orgnote;
    }

    @Basic
    @Column(name = "ocode")
    public String getOcode() {
        return ocode;
    }

    public void setOcode(String ocode) {
        this.ocode = ocode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Organize organize = (Organize) o;

        if (oid != organize.oid) return false;
        if (pnumber != organize.pnumber) return false;
        if (oname != null ? !oname.equals(organize.oname) : organize.oname != null) return false;
        if (director != null ? !director.equals(organize.director) : organize.director != null) return false;
        if (phone != null ? !phone.equals(organize.phone) : organize.phone != null) return false;
        if (adress != null ? !adress.equals(organize.adress) : organize.adress != null) return false;
        if (email != null ? !email.equals(organize.email) : organize.email != null) return false;
        if (orgnote != null ? !orgnote.equals(organize.orgnote) : organize.orgnote != null) return false;
        if (ocode != null ? !ocode.equals(organize.ocode) : organize.ocode != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = oid;
        result = 31 * result + (oname != null ? oname.hashCode() : 0);
        result = 31 * result + (director != null ? director.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (adress != null ? adress.hashCode() : 0);
        result = 31 * result + pnumber;
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (orgnote != null ? orgnote.hashCode() : 0);
        result = 31 * result + (ocode != null ? ocode.hashCode() : 0);
        return result;
    }
}
