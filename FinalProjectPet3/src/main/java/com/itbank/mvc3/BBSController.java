package com.itbank.mvc3;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
	public String bbsSelect(BBSDTO bbsDTO, HttpServletRequest request, HttpSession session, Model model) {
		BBSDTO seBBS = bbsDAO.select(bbsDTO);
		model.addAttribute("seBBS",seBBS);
		model.addAttribute("seBBSbNum",seBBS.getbNum());
		session.setAttribute("seBBSid", seBBS.getbId());
		session.setAttribute("seBBSbNum", seBBS.getbNum());
		
		int bView = seBBS.getbNum();
		bbsDAO.bbsReadUpdate(bView);
		
		return "bbsOpen";
	}
	
}
