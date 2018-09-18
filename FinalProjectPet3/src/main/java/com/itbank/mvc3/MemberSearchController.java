package com.itbank.mvc3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberSearchController {

	@Autowired
	MemberDAO dao;
	
	@RequestMapping("memberSearchId")
	public String searchid(HttpServletRequest request, Model model, HttpSession session) {
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		try {
		MemberDTO memberDTO2 = dao.selectId(tel);
		if(memberDTO2.getId().equals(name) && memberDTO2.getPw().equals(tel)) {
			String id = memberDTO2.getId();
			model.addAttribute("name", name);
			model.addAttribute("id", id);
			return "membersearchid";
		}
		else {
			return "memberSearchFail";
		}
		}
		catch (Exception e) {
			return "memberSearchFail";
		}
	}
	@RequestMapping("memberSearchPw")
	public String serachpw(HttpServletRequest request, Model model, HttpSession session) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		try {
			
		MemberDTO memberDTO2 = dao.selectId(id);
		if(memberDTO2.getId().equals(id) && memberDTO2.getTel().equals(tel)&& memberDTO2.getName().equals(name))  {
			String pw = memberDTO2.getPw();
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			return "membersearchpw";
			
		}
		else {
			return "memberLoginFail";
		}
		}
		catch (Exception e) {
			return "memberLoginFail";
		}
			
			
		}
}








