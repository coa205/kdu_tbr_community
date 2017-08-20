package com.dgit.service;

import java.util.List;

import com.dgit.domain.ReplyVO;
import com.dgit.domain.SearchCriteria;

public interface ReplyService {
	public void addReply(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> listReply(Integer bno, String kindboard) throws Exception;
	
	public ReplyVO replyNo(Integer rno, String kindboard)throws Exception;
	
	public void modifyReply(ReplyVO vo) throws Exception;
	
	public void removeReply(Integer rno, Integer bno, String kindboard) throws Exception;
	
	public void deleteAll(Integer bno, String kindboard) throws Exception;
	
	public List<ReplyVO> listPage(int bno, String kindboard, SearchCriteria cri)throws Exception;
	
	public int count(int bno, String kindboard) throws Exception;
	
	public double scoreAvg(Integer bno, String kindboard) throws Exception;
}
