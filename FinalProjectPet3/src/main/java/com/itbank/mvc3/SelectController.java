package com.itbank.mvc3;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SelectController {

		@Autowired
		MemberDAO memberDAO;
	
	@RequestMapping("select.do")
	public String select(@RequestParam("id") String id, 
						MemberDTO memberDTO, 
						Model model) throws Exception {
		MemberDTO memberDTO2 = memberDAO.select(memberDTO);
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
		ArrayList list = (ArrayList) memberDAO.selectAll();
		model.addAttribute(list);
		
		return "selectAllResult";
	}
}



