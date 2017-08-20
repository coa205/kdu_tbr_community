package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ScheduleVO;
import com.dgit.persistence.ScheduleDao;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao dao;
	
	@Override
	public List<ScheduleVO> listSchedule() throws Exception {
		return dao.listSchedule();
	}
	
	@Override
	public String scheduleByNo(ScheduleVO vo) throws Exception {
		return dao.scheduleByNo(vo);
	}
	
	@Override
	public void subSchedule(ScheduleVO vo) throws Exception {
		dao.subSchedule(vo);
	}

	@Override
	public void modSchedule(ScheduleVO vo) throws Exception {
		dao.modSchedule(vo);
	}

	@Override
	public void delSchedule(ScheduleVO vo) throws Exception {
		dao.delSchedule(vo);
	}

}
