package com.dgit.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.BoardVO;
import com.dgit.domain.MemberVO;
import com.dgit.service.BoardService;
import com.dgit.service.MemberService;
import com.dgit.service.MessageService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/user")
public class UserController {
		
	@Autowired
	BoardService boardService;
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MessageService msgService;
	
	@Resource(name="uploadPath")
	String uploadPath;
	String getProName = this.getClass().getResource("").getPath();
	String upload = getProName.substring(0, getProName.lastIndexOf("workspace_kdu") + 14) + "img_user";
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void getLogin(Model model, MemberVO member) throws Exception{
		model.addAttribute("listMember", service.readMemberAll());
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void getJoin(){
		
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void POSTLogin(Model model, MemberVO member) throws Exception{
		MemberVO vo = service.login(member.getUserid(), member.getUserpw());
		int isAdmin = service.isAdmin(member.getUserid());
		model.addAttribute("isAdmin", isAdmin);
		
		if(vo == null){
			//회원가입을 한적이 없으면, memberVO키가 없음
			//interceptor에서 memberVO키가 없으면 login화면으로 다시 가도록 처리
			return;
		}
		
		model.addAttribute("loginVO", vo);
		
	}
	
	@RequestMapping(value="/joinPost", method=RequestMethod.POST)
	public void POSTjoin(Model model, MemberVO member, List<MultipartFile> files) throws Exception{
		ArrayList<String> listFile = new ArrayList<>();

		try{
			for(MultipartFile file : files){
				System.out.println(upload);
				String thumb = UploadFileUtils.uploadFile(upload, 
						file.getOriginalFilename(), 
						file.getBytes());
				listFile.add(thumb);
			}
			
			member.setMemberpic(listFile.get(0));
			System.out.println(member.getMemberpic());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Integer creatResult = service.createMember(member);
			model.addAttribute("creatResult", creatResult);
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="displayFile") //  /filename
	public ResponseEntity<byte[]> displayFile(String filename) throws IOException{
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		
		try{
			String formatName = filename.substring(filename.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders header = new HttpHeaders();
			header.setContentType(mType);
			
			String front = filename.substring(0, 12);
			String end = filename.substring(14);
			String originalName = front + end;
			
			in = new FileInputStream(upload + "/" + originalName);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), header, HttpStatus.CREATED); //in에 있는 바이트 배열을 꺼내줌
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(Model model, HttpSession session) throws Exception{
		session.removeAttribute("loginid");
		session.removeAttribute("loginnick");
		session.removeAttribute("userpic");
		session.removeAttribute("isAdmin");
		session.invalidate();
		
		List<BoardVO> list = boardService.listWeekBest();
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
	
	@RequestMapping(value="/msg", method=RequestMethod.GET)
	public String read(Model model) throws Exception{
		model.addAttribute("msgList", msgService.listTakeMsg());
		return "user/msg";
	}
	
	public BoardVO listWBSetting(BoardVO vo) throws Exception{
		BoardVO read = boardService.read(vo.getBno(), vo.getKindboard());
		return read;
	}
}
