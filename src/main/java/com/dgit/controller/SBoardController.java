package com.dgit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.BoardVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.BoardService;
import com.dgit.service.ReplyService;
import com.dgit.service.ScheduleService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/sboard/*")
public class SBoardController {
	private static final Logger logger = LoggerFactory.getLogger(SBoardController.class);

	@Autowired
	BoardService service;
	
	@Autowired
	ReplyService replyService;
	
	@Autowired
	ScheduleService scheduleService;
	
	@Resource(name="uploadPath")
	String uploadPath;
	String getProName = this.getClass().getResource("").getPath();
	String upload = getProName.substring(0, getProName.lastIndexOf("workspace_kdu") + 14) + "img_book";
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String registerGET(Model model, BoardVO board, String kindboard, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		model.addAttribute("modify", false);
		model.addAttribute("kindboard", kindboard);
		model.addAttribute("board", board);
		model.addAttribute("cri", cri);
		return "sboard/register";
	}
	
	@RequestMapping(value="listPage", method=RequestMethod.GET)
	public String listPage(Model model, String kindboard, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		logger.info("----------list----------GET");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchCount(cri, kindboard));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list",service.listSearch(cri, kindboard));
		model.addAttribute("kindboard", kindboard);
		
		return "sboard/listPage";
	}
	
	@RequestMapping(value="listAll", method=RequestMethod.POST)
	public String listAllPOST(Model model, HttpSession session, String title, String nickname, String content, 
			List<MultipartFile> files, String kindboard, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		ArrayList<String> listFile = new ArrayList<>();
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setNickname(nickname);
		vo.setUserid((String) session.getAttribute("loginid"));
		vo.setContent(content);
		vo.setKindboard(kindboard);

		try{
			for(MultipartFile file : files){

				logger.info("filename : " + file.getOriginalFilename());
				System.out.println(upload);
				String thumb = UploadFileUtils.uploadFile(upload, 
						file.getOriginalFilename(), 
						file.getBytes());
				listFile.add(thumb);
			}
			
			vo.setFiles(listFile.toArray(new String[files.size()]));
			
			for(String e : vo.getFiles()){
				System.out.println(e);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			service.regist(vo);
		}
		
		model.addAttribute("list",service.listSearch(cri, kindboard));
		model.addAttribute("kindboard", kindboard);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchCount(cri, kindboard));
		model.addAttribute("pageMaker", pageMaker);
		
		return "sboard/listPage";
	}
	
	@ResponseBody
	@RequestMapping(value="displayFile") //  /filename
	public ResponseEntity<byte[]> displayFile(String filename) throws IOException{
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		
		logger.info("----- displayFile : " + filename);
		
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
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(Model model, BoardVO vo, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		List<String> fileNames = service.attachByNo(vo.getBno(), vo.getKindboard());
		for(String img : fileNames){
			File file = new File(upload + img);
			file.delete();
			
			String front = img.substring(0, 12);
			String end = img.substring(14);
			String originalName = front + end;
			File file2 = new File(upload + originalName);
			file2.delete();
		
			service.delAttach(img, vo.getBno(), vo.getKindboard());
		}
		service.remove(vo.getBno(), vo.getKindboard());
		return listPage(model, vo.getKindboard(), cri);
	}
	
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modifyGET(Model model, BoardVO vo, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		BoardVO board = service.read(vo.getBno(), vo.getKindboard());
	
		model.addAttribute("imgList", vo.getFiles());
		model.addAttribute("modify", true);
		model.addAttribute("board", board);
		model.addAttribute("kindboard", vo.getKindboard());
	
		return "sboard/register";
	}
	
	@RequestMapping(value="modify2", method=RequestMethod.POST)
	public String modifyPOST(HttpSession session, Model model, String title, int isbest, String nickname, String content, Integer bno, String kindboard, @ModelAttribute("cri") SearchCriteria cri, 
			String[] delImgList, List<MultipartFile> files) throws Exception{
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setUserid((String) session.getAttribute("loginid"));
		vo.setNickname(nickname);
		vo.setBno(bno);
		vo.setKindboard(kindboard);
		vo.setIsbest(isbest);
		
		try{
			for(String img : delImgList){
				File file = new File(upload + img);
				file.delete();
				
				String front = img.substring(0, 12);
				String end = img.substring(14);
				String originalName = front + end;
				File file2 = new File(upload + originalName);
				file2.delete();
			
				service.delAttach(img, vo.getBno(), vo.getKindboard());
			}
		} catch (Exception e) {	
		} finally {
			ArrayList<String> listFile = new ArrayList<>();
			
			try{
				for(MultipartFile file : files){
					logger.info("filename : " + file.getOriginalFilename());
					
					if(!file.getOriginalFilename().equals("")){
						String thumb = UploadFileUtils.uploadFile(upload, 
								file.getOriginalFilename(), 
								file.getBytes());
						listFile.add(thumb);
						vo.setFiles(listFile.toArray(new String[files.size()]));
					}	
				}
			} catch (Exception e) {
			} finally {
				service.modify(vo);
				
				List<String> fileNames = service.attachByNo(vo.getBno(), vo.getKindboard());
				model.addAttribute("imgList", fileNames);
			}
		}
		
		model.addAttribute("board", vo);
		return "sboard/read";
	}
	
	@RequestMapping(value="/schedule", method=RequestMethod.GET)
	public String schedule(Model model) throws Exception{
		return "schedule/schedule";
	}
}
