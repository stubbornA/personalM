package com.lyf.service.imp;

import com.lyf.dao.GenericHibernateDAO;
import com.lyf.pojos.Message;
import com.lyf.service.MessageService;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fangjiejie on 2018/4/19.
 */
@Service("messageService")
public class MessageServiceImp extends GenericHibernateDAO implements MessageService{
    @Override
    public List<Message> queryMessageList() {
        Query query=this.createQuery("from Message");
        List<Message> list=query.list();
        return list;
    }

    @Override
    public void addMessage(Message message) {
        this.save(message);
    }

    @Override
    public void deleteMessageById(int mid) {
        this.deleteByIds(Message.class,mid);
    }

    @Override
    public Message queryMessageById(int mid) {
        return (Message) this.getObjById(Message.class,mid);
    }
}
