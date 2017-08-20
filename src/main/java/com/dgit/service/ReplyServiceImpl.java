package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.ReplyVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.BoardDao;
import com.dgit.persistence.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDao dao;
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public void addReply(ReplyVO vo) throws Exception {
		dao.create(vo);
		if(!vo.getKindboard().equals(vo.getKindboard()+"best")){
			boardDao.updateReplyCnt(vo.getBno(), 1, vo.getKindboard());
		}
	}

	@Override
	public List<ReplyVO> listReply(Integer bno, String kindboard) throws Exception {
		return dao.list(bno, kindboard);
	}
	
	@Override
	public ReplyVO replyNo(Integer rno, String kindboard) throws Exception {
		return dao.replyNo(rno, kindboard);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	@Transactional
	public void removeReply(Integer rno, Integer bno, String kindboard) throws Exception {
		dao.delete(rno, bno, kindboard);
		boardDao.updateReplyCnt(bno, -1, kindboard);
	}
	
	@Override
	public void deleteAll(Integer bno, String kindboard) throws Exception {
		dao.deleteAll(bno, kindboard);
	}

	@Override
	public List<ReplyVO> listPage(int bno, String kindboard, SearchCriteria cri) throws Exception {
		return dao.listPage(bno, kindboard, cri);
	}

	@Override
	public int count(int bno, String kindboard) throws Exception {
		return dao.count(bno, kindboard);
	}

	@Override
	public double scoreAvg(Integer bno, String kindboard) throws Exception {
		return dao.scoreAvg(bno, kindboard);
	}
	
}
