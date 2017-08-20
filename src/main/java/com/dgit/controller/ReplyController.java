package com.dgit.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.BoardVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.ReplyVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.BoardService;
import com.dgit.service.ReplyService;

//@Controller (@ResponseBody 필요)
@RestController //(json지원, @ResponseBody생략가능하게함)
@RequestMapping("/replies")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/all/{bno}/{kindboard}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(Model model, @PathVariable("bno") Integer bno, @PathVariable("kindboard") String kindboard, SearchCriteria cri){
		ResponseEntity<List<ReplyVO>> entity = null;
		
		try{
			List<ReplyVO> list = service.listPage(bno, kindboard, cri); //service.listReply(bno)
			model.addAttribute("list",service.listPage(bno, kindboard, cri));
				
			entity = new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);//400
		}
		return entity;
	}
	
	@RequestMapping(value="/ChangePage/{bno}/{idx}/{replyCnt}/{kindboard}", method=RequestMethod.GET)
	public ResponseEntity<List<Object>> listChange(Model model, @PathVariable("bno") Integer bno, @PathVariable("idx") Integer idx, @PathVariable("replyCnt") Integer replyCnt, @PathVariable("kindboard") String kindboard, SearchCriteria cri){
		ResponseEntity<List<Object>> entity = null;
		List<Object> list = new ArrayList<>();
		
		try{
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.getCri().setPage(idx);
			pageMaker.setTotalCount(replyCnt);
			
			list.add(service.listPage(bno, kindboard, cri));
			list.add(pageMaker);
				
			entity = new ResponseEntity<List<Object>>(list, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);//400
		}
		return entity;
	}
	
	@RequestMapping(value="/add/{kindboard}", method=RequestMethod.POST)
	public ResponseEntity<String> add(@RequestBody ReplyVO vo, @PathVariable("kindboard") String kindboard){
		ResponseEntity<String> entity = null;
		
		try {
			vo.setKindboard(kindboard);
			service.addReply(vo);
			
			BoardVO board = new BoardVO();
			board.setBno(vo.getBno());
			board.setKindboard(kindboard);
			board.setScoreavg(service.scoreAvg(vo.getBno(), kindboard));
			boardService.modify(board);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e){
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);//400
		}
		
		return entity;
	}
	
	@RequestMapping(value="/delete/{rno}/{bno}/{kindboard}", method=RequestMethod.DELETE)
	public ResponseEntity<String> add(@PathVariable("rno") Integer rno, @PathVariable("bno") Integer bno, @PathVariable("kindboard") String kindboard, SearchCriteria cri){
		ResponseEntity<String> entity = null;
		
		try {
			service.removeReply(rno, bno, kindboard);
			List<ReplyVO> list = service.listPage(bno, kindboard, cri);
			
			BoardVO board = new BoardVO();
			board.setBno(bno);
			board.setKindboard(kindboard);
			if(list.size()!=0){
				board.setScoreavg(service.scoreAvg(bno, kindboard));
			}else{
				board.setScoreavg(0.0);
			}
			boardService.modify(board);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e){
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);//400
		}
		
		return entity;
	}
	
	@RequestMapping(value="/update/{rno}/{bno}/{kindboard}", method=RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @PathVariable("bno") Integer bno, @PathVariable("kindboard") String kindboard, @RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		
		try{
			vo.setRno(rno);
			vo.setBno(bno);
			vo.setKindboard(kindboard);
			service.modifyReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/LBupdate/{rno}/{bno}/{kindboard}", method=RequestMethod.PUT)
	public ResponseEntity<String> LBupdate(@PathVariable("rno") Integer rno, @PathVariable("bno") Integer bno, @PathVariable("kindboard") String kindboard, @RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		
		try{
			
			vo.setRno(rno);
			vo.setBno(bno);
			vo.setKindboard(kindboard);
			service.modifyReply(vo);
			
			BoardVO board = new BoardVO();
			board.setBno(bno);
			board.setKindboard(kindboard);
			board.setScoreavg(service.scoreAvg(bno, kindboard));
			
			boardService.modify(board);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
