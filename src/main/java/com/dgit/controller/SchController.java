package com.dgit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.ScheduleVO;
import com.dgit.service.ScheduleService;

@RestController
@RequestMapping("/schedule")
public class SchController {
	
	@Autowired
	ScheduleService service;
	
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public ResponseEntity<List<ScheduleVO>> list(Model model){
		ResponseEntity<List<ScheduleVO>> entity = null;
		
		try{
			List<ScheduleVO> list = service.listSchedule();	
			model.addAttribute("listSchedule", list);
			
			entity = new ResponseEntity<List<ScheduleVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<ScheduleVO>>(HttpStatus.BAD_REQUEST);//400
		}
		return entity;
	}
	
	@RequestMapping(value="/sub", method=RequestMethod.POST)
	public ResponseEntity<String> sub(Model model, @RequestBody ScheduleVO vo){
		ResponseEntity<String> entity = null;
		
		try {
			service.subSchedule(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e){
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);//400
		}
		
		return entity;
	}
	
	@RequestMapping(value="/mod", method=RequestMethod.POST)
	public ResponseEntity<String> mod(Model model, @RequestBody ScheduleVO vo){
		ResponseEntity<String> entity = null;
		
		try {
			service.modSchedule(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e){
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);//400
		}
		
		return entity;
	}
	
	@RequestMapping(value="/del", method=RequestMethod.POST)
	public ResponseEntity<String> del(Model model, @RequestBody ScheduleVO vo){
		ResponseEntity<String> entity = null;
		
		try {
			service.delSchedule(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e){
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);//400
		}
		
		return entity;
	}
	
	@RequestMapping(value="/byNo", method=RequestMethod.POST)
	public ResponseEntity<String> byNo(Model model, @RequestBody ScheduleVO vo){
		ResponseEntity<String> entity = null;
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			String sch = service.scheduleByNo(vo);
			model.addAttribute("sch", sch);
			entity = new ResponseEntity<String>(sch, responseHeaders, HttpStatus.OK);
		} catch (Exception e){
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);//400
		}
		
		return entity;
	}
}
