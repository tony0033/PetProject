package com.itbank.mvc3;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SelectController {

		@Autowired
		MemberDAO memberDAO;
		@Autowired
		DiaryDAO diaryDAO;
		
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
	
	
	@RequestMapping("diaryselect.do")
	
	public @ResponseBody ArrayList<DiaryDTO> selectdiary(@RequestParam("calendar") String calendar, DiaryDTO diaryDTO, HttpSession session){
		String id = (String)session.getAttribute("id");
		diaryDTO.setCalendar(calendar);
		diaryDTO.setId(id);
		
		ArrayList<DiaryDTO> list = (ArrayList<DiaryDTO>) diaryDAO.selectDate(diaryDTO);
		
		
		return list;
	}
	
	
	@RequestMapping("diaryselectId.do")
	public @ResponseBody ArrayList<DiaryDTO> selectdiaryid(DiaryDTO diaryDTO, HttpSession session){
		String id = (String)session.getAttribute("id");
		diaryDTO.setId(id);
		
		ArrayList<DiaryDTO> list = (ArrayList<DiaryDTO>) diaryDAO.selectId(diaryDTO);
		
		
		return list;
	}
	
	
	
	
	
}



