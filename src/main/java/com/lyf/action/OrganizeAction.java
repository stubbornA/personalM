package com.lyf.action;

import com.lyf.pojos.Organize;
import com.lyf.service.OrganizeService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by fangjiejie on 2018/4/17.
 */
public class OrganizeAction extends ActionSupport implements ModelDriven<Organize>,ServletRequestAware,ServletResponseAware {

    HttpServletRequest request;
    HttpServletResponse response;
    Organize organize=new Organize();
    @Autowired
    @Qualifier("organizeService")
    OrganizeService organizeService;

    public String organizeList(){
        List<Organize> list=organizeService.getOrganizeList();
        request.setAttribute("olist",list);
        return "organizeList";
    }
    public String organizeLook(){
        int oid=Integer.parseInt(request.getParameter("oid"));
        Organize organize=organizeService.getOrganizeByOid(oid);
        request.setAttribute("organize",organize);
        return "organizeLook";
    }
    public String towardOrganizeUpdate(){
        int oid=Integer.parseInt(request.getParameter("oid"));
        Organize organize=organizeService.getOrganizeByOid(oid);
        request.setAttribute("organize",organize);
        return "towardOrganizeUpdate";
    }
    public String organizeUpdate(){
        organizeService.updateOrganize(organize);
        List<Organize> list=organizeService.getOrganizeList();
        request.setAttribute("olist",list);
        return "organizeList";
    }
    public String organizeDelete(){
        int oid=Integer.parseInt(request.getParameter("oid"));
        organizeService.deleteOrganize(oid);
        List<Organize> list=organizeService.getOrganizeList();
        request.setAttribute("olist",list);
        return "organizeList";
    }
    public String towardOrganizeAdd(){
        return "towardOrganizeAdd";
    }
    public String organizeAdd(){
        organizeService.addOrganize(organize);
        List<Organize> list=organizeService.getOrganizeList();
        request.setAttribute("olist",list);
        return "organizeList";
    }
    @Override
    public Organize getModel() {
        return organize;
    }
    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request=httpServletRequest;
    }
    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response=httpServletResponse;
    }
}
