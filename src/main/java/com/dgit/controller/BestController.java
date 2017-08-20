package com.dgit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.BoardVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.BoardService;
import com.dgit.service.ReplyService;

@Controller
@RequestMapping("/sboard/*")
public class BestController {
	
	@Autowired
	BoardService service;
	
	@Autowired
	ReplyService replyService;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping(value="read", method=RequestMethod.GET)
	public String read(Model model, BoardVO vo, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		vo = service.read(vo.getBno(), vo.getKindboard());
		
		List<String> fileNames = service.attachByNo(vo.getBno(), vo.getKindboard());
		model.addAttribute("imgList", fileNames);
		
		service.modifyCnt(vo);
		model.addAttribute("board", vo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(vo.getReplyCnt());
		model.addAttribute("pageMaker", pageMaker);
		
		return "sboard/read";
	}
	
	@RequestMapping(value="readlcbest", method=RequestMethod.GET)
	public String readlcbest(Model model, BoardVO vo, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		vo = service.read(vo.getBno(), vo.getKindboard());
		
		service.modifyCnt(vo);
		model.addAttribute("board", vo);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(vo.getReplyCnt());
		model.addAttribute("pageMaker", pageMaker);
		
		return "sboard/readlcbest";
	}
	
	@RequestMapping(value="weekbest", method=RequestMethod.GET)
	public String weekbest(Model model) throws Exception{
		List<BoardVO> list = service.listWeekBest();
		for(BoardVO vo : list){
			if(vo.getKindboard().equals("vocabest")){
				model.addAttribute("vocaWB", listWBSetting(vo));
			}else if(vo.getKindboard().equals("lcbest")){
				model.addAttribute("lcWB", listWBSetting(vo));
			}else if(vo.getKindboard().equals("rcbest")){
				model.addAttribute("rcWB", listWBSetting(vo));
			}
		}
		return "sboard/weekbest";
	}
	
	@RequestMapping(value="subbest", method=RequestMethod.GET)
	public String subbest(Model model, BoardVO board, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		BoardVO vo = service.read(board.getBno(), board.getKindboard());
		String bookname = service.attachByNo(vo.getBno(), vo.getKindboard()).get(0);
		if(service.isBest(vo.getBno(), vo.getKindboard())==0){
			service.updateIsBest(1, vo.getBno(), vo.getKindboard());
			vo.setKindboard(vo.getKindboard()+"best");
			vo.setBookname(bookname);
			vo.setBebno(vo.getBno());
			
			service.regist(vo);
			service.updateWeekBest(vo.getKindboard());
		}
		
		return read(model, board, cri);
	}
	
	@RequestMapping(value="delbest", method=RequestMethod.GET)
	public String delbest(Model model, BoardVO board, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		String kb = board.getKindboard().substring(0, board.getKindboard().length()-4);
		service.updateIsBest(0, board.getBebno(), kb);
		System.out.println(board.toString()+"    "+kb);
		service.remove(board.getBno(), board.getKindboard());
		
		return listbest(model, board.getKindboard(), cri);
	}
	
	@RequestMapping(value="listbest", method=RequestMethod.GET)
	public String listbest(Model model, String kindboard, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchCount(cri, kindboard));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", service.listSearch(cri, kindboard));
		model.addAttribute("kindboard", kindboard);
		return "sboard/listbest";
	}
	
	public BoardVO listWBSetting(BoardVO vo) throws Exception{
		BoardVO read = service.read(vo.getBno(), vo.getKindboard());
		return read;
	}
}
