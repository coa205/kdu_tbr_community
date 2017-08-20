package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.MessageVO;

@Repository
public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "com.dgit.persistence.MessageDao";

	@Override
	public List<MessageVO> listTakeMsg() throws Exception {
		return session.selectList(namespace+".listTakeMsg");
	}

}
