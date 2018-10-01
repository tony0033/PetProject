package com.itbank.mvc3;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BBSController {

	@Autowired
	BBSDAO bbsDAO;

	@RequestMapping("bbsQuestion")
	public String bbsInsert(BBSDTO bbsDTO) {
		bbsDAO.insert(bbsDTO);
		
		return "redirect:bbs.jsp";
	}
	
	@RequestMapping("bbs")
	public String bbsSelect(Model model){
		ArrayList<BBSDTO> bList = (ArrayList<BBSDTO>)bbsDAO.selectAll();
		model.addAttribute("bList", bList);
		
		return "bbs";
	}
	

	@RequestMapping("bbsOpen.do")
	public String bbsSelect(BBSDTO bbsDTO, HttpSession session, Model model) {
		BBSDTO seBBS = bbsDAO.select(bbsDTO);
		model.addAttribute("seBBS",seBBS);
		session.setAttribute("seBBSid", seBBS.getbId());
		session.setAttribute("seBBSbTitle", seBBS.getbTitle());
		
		return "bbsOpen";
	}
	

}
