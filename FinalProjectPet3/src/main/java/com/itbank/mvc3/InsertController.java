package com.itbank.mvc3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InsertController {

	@Autowired
	MemberDAO dao;
	
	@Autowired
	DiaryDAO diarydao;
	
	@RequestMapping("insert.do")
	public String insert( MemberDTO memberDTO) {
		dao.insert(memberDTO);
		return "redirect:main.jsp";
	}
	
	@RequestMapping("diaryinsert.do")
	public String insert(DiaryDTO diaryDTO) {
		diarydao.insert(diaryDTO);
		return "insertResult";
	}
	
}








