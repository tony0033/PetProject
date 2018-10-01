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
public class InterestSelectController {

		@Autowired
		InterestDAO interestDAO;
		@Autowired
		ProductDAO dao;  
	
	

	@RequestMapping("InterestSelect2.do")
	public String select(HttpServletRequest request, Model model,  HttpSession session) throws Exception {
		String id1 = request.getParameter("id");
		
		InterestDTO dto = interestDAO.selectId(id1);
		
		model.addAttribute("list", dto);
		
		return "InterestselectAllResult";
	}
	/*@RequestMapping("InterestSelect3.do")
	public String select2(HttpServletRequest request, Model model,  HttpSession session) throws Exception {
		String id1 = request.getParameter("id");
		
		InterestDTO dto = interestDAO.selectId(id1);
		
		model.addAttribute("list", dto);
		
		return "InterestselectAllResult";
	}*/
}



