package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ScheduleVO;

public interface ScheduleDao {
	
	public List<ScheduleVO> listSchedule() throws Exception;
	
	public String scheduleByNo(ScheduleVO vo) throws Exception;
	
	public void subSchedule(ScheduleVO vo) throws Exception;
	
	public void modSchedule(ScheduleVO vo) throws Exception;
	
	public void delSchedule(ScheduleVO vo) throws Exception;
	
}
