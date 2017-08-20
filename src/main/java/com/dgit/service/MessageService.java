package com.dgit.service;

import java.util.List;

import com.dgit.domain.MessageVO;

public interface MessageService {
	
	public List<MessageVO> listTakeMsg() throws Exception;
	
}
