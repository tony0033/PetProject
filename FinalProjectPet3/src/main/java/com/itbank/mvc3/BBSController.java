package com.itbank.mvc3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BBSController {

	@Autowired
	MemberDAO dao;
	
	@RequestMapping("bbsQuestion")
	public String login(HttpServletRequest request, Model model, HttpSession session) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		MemberDTO memberDTO2 = dao.selectId(id);
		if(memberDTO2.getId().equals(id) && memberDTO2.getPw().equals(pw)) {
			session.setAttribute("id", id);
			return "main";
		}
		else {
			return "memberLoginFail";
		}
	}
}








