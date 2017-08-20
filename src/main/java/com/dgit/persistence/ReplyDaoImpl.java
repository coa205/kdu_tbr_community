package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ReplyVO;
import com.dgit.domain.SearchCriteria;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.dgit.persistence.ReplyDao";

	@Override
	public List<ReplyVO> list(Integer bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		return sqlSession.selectList(namespace + ".list", map);
	}
	
	@Override
	public ReplyVO replyNo(Integer rno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", rno);
		map.put("kindboard", kindboard);
		return sqlSession.selectOne(namespace + ".replyNo", map);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		sqlSession.insert(namespace + ".create", vo);

	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		sqlSession.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer rno, Integer bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rno", rno);
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		sqlSession.delete(namespace + ".delete", map);

	}
	
	@Override
	public void deleteAll(Integer bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		sqlSession.delete(namespace + ".deleteAll", map);
	}

	@Override
	public List<ReplyVO> listPage(int bno, String kindboard, SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("cri", cri);
		map.put("kindboard", kindboard);
		return sqlSession.selectList(namespace + ".listPage", map);
	}

	@Override
	public int count(int bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		return sqlSession.selectOne(namespace + ".count", map);
	}

	@Override
	public int getBno(int rno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rno", rno);
		map.put("kindboard", kindboard);
		return sqlSession.selectOne(namespace + ".getBno", map);
	}

	@Override
	public double scoreAvg(Integer bno, String kindboard) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("kindboard", kindboard);
		return sqlSession.selectOne(namespace+".scoreAvg", map);
	}

}
