package com.dgit.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.BoardVO;
import com.dgit.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	BoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
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
		
		return "home";
	}
	
	public BoardVO listWBSetting(BoardVO vo) throws Exception{
		BoardVO read = service.read(vo.getBno(), vo.getKindboard());
		return read;
	}
	
}
