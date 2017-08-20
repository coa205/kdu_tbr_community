package com.dgit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.BoardVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.PageMaker;
import com.dgit.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	//private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String registerGET(Model model) throws Exception{
		model.addAttribute("modify", false);
		return "board/register";
	}

	@RequestMapping(value="register", method=RequestMethod.POST)
	public String registerPOST(BoardVO vo) throws Exception{
		service.regist(vo);
		return "board/success";
		//return "redirect:listAll";
	}
	
	@RequestMapping(value="listAll", method=RequestMethod.GET)
	public String listAllGET(Model model) throws Exception{
		List<BoardVO> list = service.listAll("voca");
		model.addAttribute("list", list);
		return "board/listAll";
	}
	
	@RequestMapping(value="listPage", method=RequestMethod.GET)
	public String listPage(Model model, Criteria cri) throws Exception{
		List<BoardVO> list = service.listCriteria(cri, "voca");
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.totalCount("voca"));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/listPage";
	}
	
	@RequestMapping(value="listAll", method=RequestMethod.POST)
	public String listAllPOST(Model model, BoardVO vo) throws Exception{
		service.regist(vo);
		List<BoardVO> list = service.listAll("voca");
		model.addAttribute("list", list);
		return "board/listAll";
	}
	
	@RequestMapping(value="read", method=RequestMethod.GET)
	public String read(Model model, int bno, @ModelAttribute("cri") Criteria cri) throws Exception{
		BoardVO vo = service.read(bno, "voca");
		service.modifyCnt(vo);
		model.addAttribute("board", vo);
		return "board/read";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(Model model, int bno, @ModelAttribute("cri") Criteria cri) throws Exception{
		service.remove(bno, "voca");
		return listPage(model, cri);
	}
	
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modifyGET(Model model, int bno, @ModelAttribute("cri") Criteria cri) throws Exception{
		BoardVO vo = service.read(bno, "voca");
		model.addAttribute("modify", true);
		model.addAttribute("board", vo);
		return "board/register";
	}
	
	@RequestMapping(value="modify2", method=RequestMethod.GET)
	public String modifyPOST(Model model, BoardVO vo, @ModelAttribute("cri") Criteria cri) throws Exception{
		service.modify(vo);
		model.addAttribute("board", vo);
		return "board/read";
	}
}
