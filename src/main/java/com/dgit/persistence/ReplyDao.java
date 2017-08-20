package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ReplyVO;
import com.dgit.domain.SearchCriteria;

public interface ReplyDao {
	
	public List<ReplyVO> list(Integer bno, String kindboard)throws Exception;
	
	public ReplyVO replyNo(Integer rno, String kindboard)throws Exception;
	
	public void create(ReplyVO vo)throws Exception;
	
	public void update(ReplyVO vo)throws Exception;
	
	public void delete(Integer rno, Integer bno, String kindboard)throws Exception;
	
	public void deleteAll(Integer bno, String kindboard) throws Exception;
	
	public List<ReplyVO> listPage(int bno, String kindboard, SearchCriteria cri)throws Exception;
	
	public int count(int bno, String kindboard) throws Exception;
	
	public int getBno(int rno, String kindboard)throws Exception;
	
	public double scoreAvg(Integer bno, String kindboard)throws Exception;
}
