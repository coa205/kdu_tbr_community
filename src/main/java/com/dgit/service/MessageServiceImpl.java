package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.MessageVO;
import com.dgit.persistence.MessageDao;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDao dao;
	
	@Override
	public List<MessageVO> listTakeMsg() throws Exception {
		return dao.listTakeMsg();
	}

}
