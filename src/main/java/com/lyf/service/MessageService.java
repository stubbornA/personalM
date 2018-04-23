package com.lyf.service;

import com.lyf.pojos.Message;

import java.util.List;

/**
 * Created by fangjiejie on 2018/4/19.
 */
public interface MessageService {
    List<Message> queryMessageList();
    void addMessage(Message message);
    void deleteMessageById(int mid);
    Message queryMessageById(int mid);
}
