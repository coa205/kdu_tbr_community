package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.MessageVO;

public interface MessageDao {
	
	public List<MessageVO> listTakeMsg() throws Exception;
	
}
