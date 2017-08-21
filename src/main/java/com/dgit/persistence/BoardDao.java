package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.BoardVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.SearchCriteria;

public interface BoardDao {
	
	public void create(BoardVO vo) throws Exception;
	
	public BoardVO read(Integer bno, String kindboard)throws Exception;
	
	public void update(BoardVO vo)throws Exception;
	
	public void updateCnt(BoardVO vo)throws Exception;
	
	public void delete(Integer bno, String kindboard)throws Exception;
	
	public List<BoardVO> listAll(String kindboard)throws Exception;
	
	public List<BoardVO> listPage(int page, String kindboard)throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri, String kindboard)throws Exception;
	
	public int totalCount(String kindboard)throws Exception;
	
	public List<BoardVO> listSearch(SearchCriteria cri, String kindboard)throws Exception;
	
	public int searchCount(SearchCriteria cri, String kindboard)throws Exception;
	
	public void updateReplyCnt(int bno, int amount, String kindboard)throws Exception;
	
	public void addAttach(String fullName, String kindboard) throws Exception;
	
	public void modifyAttach(String fullName, int bno, String kindboard) throws Exception;
	
	public List<String> attachByNo(int bno, String kindboard)throws Exception;
	
	public void delAttach(String fullName, int bno, String kindboard)throws Exception;
	
	public void updateWeekBest(String kindboard) throws Exception;
	
	public void updateIsBest(int num, Integer bno, String kindboard) throws Exception;
	
	public int isBest(Integer bno, String kindboard) throws Exception;
	
	public List<BoardVO> listWeekBest() throws Exception;
	
	public List<BoardVO> dateAsc(String kindboard) throws Exception;
	
	public List<BoardVO> scoreAsc(String kindboard) throws Exception;
	
	public void recomUp(int bno, String kindboard) throws Exception;
	
}
