package com.dgit.domain;

public class ScheduleVO {
	private Integer year;
	private Integer month;
	private Integer day;
	private String schedule;
	
	public Integer getYear() {
		return year;
	}
	
	public void setYear(Integer year) {
		this.year = year;
	}
	
	public Integer getMonth() {
		return month;
	}
	
	public void setMonth(Integer month) {
		this.month = month;
	}
	
	public Integer getDay() {
		return day;
	}
	
	public void setDay(Integer day) {
		this.day = day;
	}
	
	public String getSchedule() {
		return schedule;
	}
	
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	
	@Override
	public String toString() {
		return String.format("ScheduleVO [year=%s, month=%s, day=%s, schedule=%s]", year, month, day, schedule);
	}
	
}
