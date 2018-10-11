package com.itbank.pet.interest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class interestInsertController {
	@Autowired
	InterestDAO dao;
	
	@RequestMapping("interestInput")
	private String insert(InterestDTO dto, HttpServletRequest request) {
		String num1 = request.getParameter("num");
		int num2 = Integer.parseInt(num1);
		String id1 = request.getParameter("id");
		dto.setId(id1);
		dto.setNum(num2);
		System.out.println(num2+id1);
		dao.insert(dto);
		
		return "InterestOK";
		

	}
}
