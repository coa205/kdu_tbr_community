package com.dgit.service;

import java.util.List;

import com.dgit.domain.BoardVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.SearchCriteria;

public interface BoardService {
	public void regist(BoardVO board) throws Exception;
	public BoardVO read(Integer bno, String kindboard) throws Exception;
	public void modify(BoardVO board) throws Exception;
	public void modifyCnt(BoardVO board) throws Exception;
	public void remove(Integer bno, String kindboard) throws Exception;
	public List<BoardVO> listAll(String kindboard) throws Exception;
	public List<BoardVO> listCriteria(Criteria cri, String kindboard) throws Exception;
	public int totalCount(String kindboard) throws Exception;
	public List<BoardVO> listSearch(SearchCriteria cri, String kindboard) throws Exception;
	public int searchCount(SearchCriteria cri, String kindboard) throws Exception;
	public List<String> attachByNo(int bno, String kindboard) throws Exception;
	public void delAttach(String fullName, int bno, String kindboard) throws Exception;
	public void updateWeekBest(String kindboard) throws Exception;
	public void updateIsBest(int num, Integer bno, String kindboard) throws Exception;
	public int isBest(Integer bno, String kindboard) throws Exception;
	public List<BoardVO> listWeekBest() throws Exception;
	public List<BoardVO> dateAsc(String kindboard) throws Exception;
	public List<BoardVO> scoreAsc(String kindboard) throws Exception;
	public void recomUp(int bno, String kindboard) throws Exception;
}
