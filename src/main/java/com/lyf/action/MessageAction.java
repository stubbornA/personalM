package com.lyf.action;

import com.lyf.pojos.Account;
import com.lyf.pojos.Message;
import com.lyf.service.MessageService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by fangjiejie on 2018/4/19.
 */
public class MessageAction extends ActionSupport implements ServletRequestAware,ServletResponseAware,ModelDriven<Message>{
    Message message=new Message();
    HttpServletRequest request;
    HttpServletResponse response;
    @Autowired
    @Qualifier("messageService")
    MessageService messageService;

    @Override
    public Message getModel() {
        return message;
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request=httpServletRequest;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response=httpServletResponse;
    }

    public String messageList(){
        List<Message> list=messageService.queryMessageList();
        Account account=(Account)request.getSession().getAttribute("account");
        request.setAttribute("mlist",list);
        request.setAttribute("account",account);
        return "messageList";
    }
    public String queryMessage(){
        int mid=Integer.parseInt(request.getParameter("mid"));
        Message message=messageService.queryMessageById(mid);
        request.setAttribute("message",message);
        return "queryMessage";
    }
    public String deleteMessage(){
        int mid=Integer.parseInt(request.getParameter("mid"));
        messageService.deleteMessageById(mid);
        List<Message> list=messageService.queryMessageList();
        request.setAttribute("mlist",list);
        return "messageList";
    }
    public String towardMessageSend(){
        return "towardMessageSend";
    }
    public String messageSend(){
        Account account=(Account)request.getSession().getAttribute("account");
        Timestamp timestamp=new Timestamp(System.currentTimeMillis());
        message.setMdate(timestamp);
        message.setAid(account.getAid());
        message.setUsername(account.getUsername());
        messageService.addMessage(message);
        List<Message> list=messageService.queryMessageList();
        request.setAttribute("mlist",list);
        return "messageList";
    }
}
