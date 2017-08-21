package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.BoardVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.SearchCriteria;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "com.dgit.persistence.BoardDao";

	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	
	@Override
	public BoardVO read(Integer bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		return session.selectOne(namespace+".read", map);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}
	
	@Override
	public void updateCnt(BoardVO vo) throws Exception {
		vo.setViewcnt(vo.getViewcnt()+1);
		session.update(namespace+".updateCnt", vo);
	}

	@Override
	public void delete(Integer bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		session.delete(namespace+".delete", map);
	}

	@Override
	public List<BoardVO> listAll(String kindboard) throws Exception {
		return session.selectList(namespace+".listAll", kindboard);
	}

	@Override
	public List<BoardVO> listPage(int page, String kindboard) throws Exception {
		if(page <= 0){
			page = 1;
		}
		page = (page-1) * 10; //해당 page의 시작 게시물 index를 구함
		
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("kindboard", kindboard);
		return session.selectList(namespace+".listPage", map);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		map.put("kindboard", kindboard);
		return session.selectList(namespace+".listCriteria", map);
	}

	@Override
	public int totalCount(String kindboard) throws Exception {
		return session.selectOne(namespace+".totalCount", kindboard);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		map.put("kindboard", kindboard);
		return session.selectList(namespace+".listSearch", map);
	}

	@Override
	public int searchCount(SearchCriteria cri, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		map.put("kindboard", kindboard);
		return session.selectOne(namespace+".searchCount", map);
	}

	@Override
	public void updateReplyCnt(int bno, int amount, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("amount", amount);
		map.put("kindboard", kindboard);
		session.update(namespace+".updateReplyCnt", map);
	}

	@Override
	public void addAttach(String fullname, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("fullName", fullname);
		map.put("kindboard", kindboard);
		session.insert(namespace+".addAttach", map);
	}

	@Override
	public List<String> attachByNo(int bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		return session.selectList(namespace+".attachByNo", map);
	}

	@Override
	public void delAttach(String fullName, int bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("fullName", fullName);
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		session.delete(namespace+".delAttach", map);
	}

	@Override
	public void modifyAttach(String fullName, int bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("fullName", fullName);
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		session.insert(namespace+".modifyAttach", map);
	}
	
	@Override
	public void updateWeekBest(String kindboard) throws Exception {
		session.update(namespace+".updateWeekBest", kindboard);
	}
	
	@Override
	public void updateIsBest(int num, Integer bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		session.update(namespace+".updateIsBest", map);
	}
	
	@Override
	public int isBest(Integer bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		return session.selectOne(namespace+".isBest", map);
	}

	@Override
	public List<BoardVO> listWeekBest() throws Exception {
		return session.selectList(namespace+".listWeekBest");
	}

	@Override
	public List<BoardVO> dateAsc(String kindboard) throws Exception {
		return session.selectList(namespace+".dateAsc", kindboard);
	}

	@Override
	public List<BoardVO> scoreAsc(String kindboard) throws Exception {
		return session.selectList(namespace+".scoreAsc", kindboard);
	}

	@Override
	public void recomUp(int bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		session.update(namespace+".recomUp", map);
	}

}
