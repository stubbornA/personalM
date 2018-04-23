package com.lyf.pojos;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;

/**
 * Created by fangjiejie on 2018/4/19.
 */
@Entity
public class Message {
    private int mid;
    private String mtitle;
    private String mcontent;
    private Timestamp mdate;
    private int aid;
    private String username;

    @Id
    @Column(name = "mid")
    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    @Basic
    @Column(name = "mtitle")
    public String getMtitle() {
        return mtitle;
    }

    public void setMtitle(String mtitle) {
        this.mtitle = mtitle;
    }

    @Basic
    @Column(name = "mcontent")
    public String getMcontent() {
        return mcontent;
    }

    public void setMcontent(String mcontent) {
        this.mcontent = mcontent;
    }

    @Basic
    @Column(name = "mdate")
    public Timestamp getMdate() {
        return mdate;
    }

    public void setMdate(Timestamp mdate) {
        this.mdate = mdate;
    }

    @Basic
    @Column(name = "aid")
    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Message message = (Message) o;

        if (mid != message.mid) return false;
        if (aid != message.aid) return false;
        if (mtitle != null ? !mtitle.equals(message.mtitle) : message.mtitle != null) return false;
        if (mcontent != null ? !mcontent.equals(message.mcontent) : message.mcontent != null) return false;
        if (mdate != null ? !mdate.equals(message.mdate) : message.mdate != null) return false;
        if (username != null ? !username.equals(message.username) : message.username != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = mid;
        result = 31 * result + (mtitle != null ? mtitle.hashCode() : 0);
        result = 31 * result + (mcontent != null ? mcontent.hashCode() : 0);
        result = 31 * result + (mdate != null ? mdate.hashCode() : 0);
        result = 31 * result + aid;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        return result;
    }
}
