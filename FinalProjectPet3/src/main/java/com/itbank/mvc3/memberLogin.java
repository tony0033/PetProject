package com.itbank.mvc3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberLogin {

	@Autowired
	MemberDAO dao;
	
	@RequestMapping("memberLogin")
	public String login(HttpServletRequest request, Model model, HttpSession session) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
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








