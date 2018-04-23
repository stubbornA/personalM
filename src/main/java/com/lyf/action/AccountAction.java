package com.lyf.action;

import com.lyf.pojos.Account;
import com.lyf.pojos.Organize;
import com.lyf.pojos.Role;
import com.lyf.service.AccountService;
import com.lyf.service.OrganizeService;
import com.lyf.service.RoleService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fangjiejie on 2018/4/15.
 */
public class AccountAction extends ActionSupport implements ModelDriven<Account>,ServletRequestAware,ServletResponseAware{

    private Account account=new Account();
    @Override
    public Account getModel() {//返回表单模型
        return account;
    }

    HttpServletRequest  request;
    HttpServletResponse response;
    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request=httpServletRequest;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response=httpServletResponse;
    }

    @Autowired
    @Qualifier("accountService")
    AccountService accountService;
    @Autowired
    @Qualifier("organizeService")
    OrganizeService organizeService;
    @Autowired
    @Qualifier("roleService")
    RoleService roleService;
    private String result;
    Map<String,Object> map=new HashMap<>();

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String welcome() {
        return "welcome";
    }
    public String login(){
        Account account1=accountService.login(account);
        if(account1==null){
            request.setAttribute("msg","登陆错误，请仔细检查账号和密码！");
            return "fail";
        }else{
            if(account1.getState()==0){
                request.setAttribute("msg","当前账号还未通过审核，不可登录，请谅解！");
                return "fail";
            }else{
                request.getSession().setAttribute("account",account1);
                request.setAttribute("account",account1);
                return "loginIn";
            }
        }
    }
    public String register(){
        Organize organize=organizeService.queryOrganizeByOcode(account.getOcode());
        if(organize!=null){
            account.setOid(organize.getOid());
            account.setOname(organize.getOname());
            account.setState(0);
            accountService.register(account);
            request.setAttribute("msg","注册成功！");
            return "registerSuccess";
        }else{
            request.setAttribute("msg","注册失败！");
            return "registerFail";
        }

    }
    public String towardRegister(){
        return "towardRegister";
    }
    public String getAccount(){
        Account account= (Account)request.getSession().getAttribute("account");
        if(account!=null){
            request.setAttribute("account",account);
        }
        return "getAccount";
    }
    public String AccountUpdate(){
        int aid=Integer.parseInt(request.getParameter("aid"));
        Account account=accountService.getAccountById(aid);
        String password=request.getParameter("password");
        account.setPassword(password);
        accountService.updateAccount(account);
        return "AccountUpdate";
    }
    public String getAccountInfor(){
        Account account= (Account)request.getSession().getAttribute("account");
        if(account!=null){
            request.setAttribute("account",account);
        }
        return "getAccountInfor";
    }
    public String loginOut(){
        request.getSession().setAttribute("account",null);
        return "welcome";
    }
    public String towardAccountList(){
        List<Account> list= accountService.getAccountList();
        request.setAttribute("alist",list);
        return "towardAccountList";
    }
    public String AccountDelete(){
        int aid=Integer.parseInt(request.getParameter("aid"));
        accountService.AccountDelete(aid);
        List<Account> list= accountService.getAccountList();
        request.setAttribute("alist",list);
        return "towardAccountList";
    }
    public String towardAccountAudit(){
        int aid=Integer.parseInt(request.getParameter("aid"));
        Account account=accountService.getAccountById(aid);
        List<Role> rlist=roleService.getRoleList();
        request.setAttribute("account",account);
        request.setAttribute("rlist",rlist);
        return "towardAccountAudit";
    }
    public String AccountAudit1(){
        int aid=Integer.parseInt(request.getParameter("aid"));
        String rid=request.getParameter("roles");
        Role role=roleService.getRoleById(Integer.parseInt(rid));
        Account account=accountService.getAccountById(aid);
        account.setState(1);
        account.setRid(role.getRid());
        account.setRname(role.getRname());
        accountService.updateAccount(account);
        List<Account> list= accountService.getAccountList();
        request.setAttribute("alist",list);
        return "towardAccountList";
    }
    public String AccountAudit2(){
        int aid=Integer.parseInt(request.getParameter("aid"));
        accountService.AccountDelete(aid);
        List<Account> list= accountService.getAccountList();
        request.setAttribute("alist",list);
        return "towardAccountList";
    }
}
