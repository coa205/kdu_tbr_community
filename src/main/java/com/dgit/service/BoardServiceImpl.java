package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.BoardVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.BoardDao;
import com.dgit.persistence.ReplyDao;

@Service //루트 컨텍스트에 Service를 인식 할 수 있도록 함
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private ReplyDao replyDao;

	@Transactional
	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
		
		if(board.getFiles() == null) //보호처리
			return;
			
		for(String fullname : board.getFiles()){
			dao.addAttach(fullname, board.getKindboard());
		}
	}

	@Override
	public BoardVO read(Integer bno, String kindboard) throws Exception {
		return dao.read(bno, kindboard);
	}

	@Transactional
	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
		
		if(board.getFiles() == null) //보호처리
			return;
			
		for(String fullname : board.getFiles()){
			dao.modifyAttach(fullname, board.getBno(), board.getKindboard());
		}
	}
	
	@Override
	public void modifyCnt(BoardVO board) throws Exception {
		dao.updateCnt(board);
	}

	@Override
	public void remove(Integer bno, String kindboard) throws Exception {
		replyDao.deleteAll(bno, kindboard);
		dao.delete(bno, kindboard);
	}

	@Override
	public List<BoardVO> listAll(String kindboard) throws Exception {
		return dao.listAll(kindboard);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri, String kindboard) throws Exception {
		return dao.listCriteria(cri, kindboard);
	}

	@Override
	public int totalCount(String kindboard) throws Exception {
		return dao.totalCount(kindboard);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri, String kindboard) throws Exception {
		return dao.listSearch(cri, kindboard);
	}

	@Override
	public int searchCount(SearchCriteria cri, String kindboard) throws Exception {
		return dao.searchCount(cri, kindboard);
	}

	@Override
	public List<String> attachByNo(int bno, String kindboard) throws Exception {
		return dao.attachByNo(bno, kindboard);
	}

	@Override
	public void delAttach(String fullName, int bno, String kindboard) throws Exception {
		dao.delAttach(fullName, bno, kindboard);
	}
	
	@Override
	public void updateWeekBest(String kindboard) throws Exception {
		dao.updateWeekBest(kindboard);
	}
	
	@Override
	public void updateIsBest(int num, Integer bno, String kindboard) throws Exception {
		dao.updateIsBest(num, bno, kindboard);
	}
	
	@Override
	public int isBest(Integer bno, String kindboard) throws Exception {
		return dao.isBest(bno, kindboard);
	}

	@Override
	public List<BoardVO> listWeekBest() throws Exception {
		return dao.listWeekBest();
	}

	@Override
	public List<BoardVO> dateAsc(String kindboard) throws Exception {
		return dao.dateAsc(kindboard);
	}

	@Override
	public List<BoardVO> scoreAsc(String kindboard) throws Exception {
		return dao.scoreAsc(kindboard);
	}

}
