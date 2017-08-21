package com.dgit.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.BoardVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.BoardDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDaoTest {
	private static final Logger logger = LoggerFactory.getLogger(BoardDaoTest.class);
	
	@Autowired
	private BoardDao dao;
	
	//@Test
	public void testCreate() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("제목임");
		board.setContent("새로운 글을 넣습니다.");
		board.setNickname("user01");
		dao.create(board);
	}
	
	//@Test
	public void testRead() throws Exception {
		BoardVO bod = dao.read(2, "voca");
		System.out.println("번호 : " + bod.getBno());
		System.out.println("제목 : " + bod.getTitle());
		System.out.println("내용 : " + bod.getContent());
		System.out.println("작성자 : " + bod.getNickname());
	}
	
	//@Test
	public void testUpdate() throws Exception {
		BoardVO board = new BoardVO();
		board.setBno(1);
		board.setTitle("수정된 글입니다.");
		board.setContent("수정 테스트");
		dao.update(board);
	}
	
	//@Test
	public void testDelete() throws Exception {
		dao.delete(2, "voca");
	}
	
	//@Test
	public void testReadMemberAll() throws Exception{
		List<BoardVO> bodList = dao.listAll("voca");
		System.out.println();
		System.out.println("================================================================");
		for(BoardVO b : bodList){
			System.out.println(
			"번호 : " + b.getBno() 
			+ " 제목 : " + b.getTitle() 
			+ " 내용 : " + b.getContent() 
			+ " 작성자 : " + b.getNickname());
		}
		System.out.println("================================================================");
		System.out.println();
	}
	
	//@Test
	public void testListPage() throws Exception{
		int page = 1;
		List<BoardVO> list = dao.listPage(page, "voca");
		for(BoardVO vo : list){
			logger.info(vo.getBno() + " : " + vo.getTitle());
		}
	}
	
	//@Test
	public void testListCriteria() throws Exception{
		Criteria criteria = new Criteria();
		criteria.setPage(1);
		criteria.setPerPageNum(20);
		
		System.out.println(criteria.toString());
		
		List<BoardVO> list = dao.listCriteria(criteria, "voca");
		for(BoardVO vo : list){
			System.out.println(vo.getBno() + " : " + vo.getTitle());
		}
	}
	
	//@Test
	public void testListSearch() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword("제발");
		cri.setSearchType("t");
		dao.listSearch(cri, "voca");
	}
	
	@Test
		public void testrecomUp() throws Exception{
			dao.recomUp(215, "voca");
		}
}
