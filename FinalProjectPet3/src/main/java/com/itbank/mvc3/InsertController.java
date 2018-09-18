package com.itbank.mvc3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InsertController {

	@Autowired
	MemberDAO dao;
	
	@RequestMapping("insert.do")
	public String insert( MemberDTO memberDTO) {
		dao.insert(memberDTO);
		return "redirect:main.jsp";
	}
	
}








