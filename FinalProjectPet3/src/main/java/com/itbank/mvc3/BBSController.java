package com.itbank.mvc3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BBSController {

	@Autowired
	BBSDAO bbsDAO;

	@RequestMapping("bbsQuestion")
	public String bbsInsert(BBSDTO bbsDTO) {
		bbsDAO.insert(bbsDTO);
		
		return "redirect:main.jsp";
	}
}
