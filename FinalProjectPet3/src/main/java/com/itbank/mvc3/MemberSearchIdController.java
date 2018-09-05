package com.itbank.mvc3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberSearchIdController {

	@Autowired
	MemberDAO dao;
	
	@RequestMapping("memberSearchId")
	public String login(HttpServletRequest request, Model model, HttpSession session) {
		String name = request.getParameter("name");
		String tel = request.getParameter("name");
		
		MemberDTO memberDTO2 = dao.selectId(name);
		if(memberDTO2.getId().equals(name) && memberDTO2.getPw().equals(tel)) {
			return "main";
		}
		else {
			return "memberLoginFail";
		}
	}
}








