package com.itbank.mvc3;

import javax.servlet.http.HttpServletRequest;

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
	public String insert( MemberDTO memberDTO, HttpServletRequest request) {
		String address2 = request.getParameter("address2");
		memberDTO.setAddress(memberDTO.getAddress() + " " + address2);
		dao.insert(memberDTO);
		return "redirect:main.jsp";
	}
	
	
}








