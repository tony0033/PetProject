package com.itbank.mvc3;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;

	@RequestMapping("memberLogin")
	public String login(HttpServletRequest request, Model model, HttpSession session) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		try {
			MemberDTO memberDTO2 = dao.selectId(id);
			if (memberDTO2.getId().equals(id) && memberDTO2.getPw().equals(pw)) {
				String nickname = memberDTO2.getNickname();
				String name = memberDTO2.getName();

				session.setAttribute("id", id);
				session.setAttribute("name", name);
				session.setAttribute("nickname", nickname);
				return "main";
			} else {
				return "memberLoginFail";
			}
		} catch (Exception e) {
			return "memberLoginFail";
		}

	}

	@RequestMapping("callback.do")
	public String callback() {
		return "callback";
	}

	@RequestMapping("memberSearchId")
	public String searchid(HttpServletRequest request, Model model, HttpSession session) {
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");

		try {
			MemberDTO memberDTO2 = dao.selectId(tel);
			if (memberDTO2.getId().equals(name) && memberDTO2.getPw().equals(tel)) {
				String id = memberDTO2.getId();
				model.addAttribute("name", name);
				model.addAttribute("id", id);
				return "membersearchid";
			} else {
				return "memberSearchFail";
			}
		} catch (Exception e) {
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
			if (memberDTO2.getId().equals(id) && memberDTO2.getTel().equals(tel) && memberDTO2.getName().equals(name)) {
				String pw = memberDTO2.getPw();
				model.addAttribute("id", id);
				model.addAttribute("pw", pw);
				return "membersearchpw";

			} else {
				return "memberLoginFail";
			}
		} catch (Exception e) {
			return "memberLoginFail";
		}

	}

	@RequestMapping("insert.do")
	public String insert(MemberDTO memberDTO) {
		dao.insert(memberDTO);
		return "redirect:main.jsp";
	}
	@RequestMapping("select.do")
	public String select(@RequestParam("id") String id, 
						MemberDTO memberDTO, 
						Model model) throws Exception {
		MemberDTO memberDTO2 = dao.select(memberDTO);
		//MemberDTO memberDTO2 = memberDAO.select(memberDTO.getId());
		System.out.println("id : "+memberDTO2.getId());
		System.out.println("pw : "+memberDTO2.getPw());
		System.out.println("name : "+memberDTO2.getName());
		System.out.println("tel : "+memberDTO2.getTel());
		model.addAttribute("memberDTO2", memberDTO2);
		
		return "selectResult";
	}
	

	@RequestMapping("selectAll.do")
	public String select(Model model, ArrayList<MemberDTO> list2) throws Exception {
		ArrayList list = (ArrayList) dao.selectAll();
		model.addAttribute(list);
		
		return "selectAllResult";
	}

}
