package com.dgit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/chat")
public class ChatController{
	
	@RequestMapping(value="/chat", method=RequestMethod.GET)
	public String chat(Model model) throws Exception{
		return "chat/chat";
	}
}
