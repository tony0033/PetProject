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
	public String bbsSelect(Model model) throws Exception {
		ArrayList<BBSDTO> bList = (ArrayList<BBSDTO>)bbsDAO.selectAll();
		model.addAttribute("bList", bList);
		for (int i = 0; i < bList.size(); i++) {
			BBSDTO dto3 = bList.get(i);
			System.out.println(dto3.getbId());
			System.out.println(dto3.getbNum());
		}
		return "bbs";
	}
	

	@RequestMapping("bbsOpen")
	public String bbsSelect(BBSDTO bbsDTO, HttpSession session,Model model) {
		BBSDTO seBBS = bbsDAO.select(bbsDTO);
		model.addAttribute("seBBS",seBBS);
		session.setAttribute("seBBS", seBBS.getbId());
		
		return "bbsOpen";
	}
	

}
