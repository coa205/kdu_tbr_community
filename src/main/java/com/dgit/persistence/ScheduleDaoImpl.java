package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ScheduleVO;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {

	@Autowired
	private SqlSession session;
	
	private static final String namespace = "com.dgit.persistence.ScheduleDao";
	
	@Override
	public List<ScheduleVO> listSchedule() throws Exception {
		return session.selectList(namespace+".listSchedule");
	}
	
	@Override
	public String scheduleByNo(ScheduleVO vo) throws Exception {
		return session.selectOne(namespace+".scheduleByNo", vo);
	}
	
	@Override
	public void subSchedule(ScheduleVO vo) throws Exception {
		session.insert(namespace+".subSchedule", vo);
	}

	@Override
	public void modSchedule(ScheduleVO vo) throws Exception {
		session.update(namespace+".modSchedule", vo);
	}

	@Override
	public void delSchedule(ScheduleVO vo) throws Exception {
		session.delete(namespace+".delSchedule", vo);
	}

}
