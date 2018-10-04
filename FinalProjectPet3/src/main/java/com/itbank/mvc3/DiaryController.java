package com.itbank.mvc3;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DiaryController {

	@Autowired
	DiaryDAO diarydao;
	
	@RequestMapping("diaryinsert.do")
	public String insert(DiaryDTO diaryDTO) {
		diarydao.insert(diaryDTO);
		return "redirect:diarymain.jsp";
	}
	@RequestMapping("diaryselect.do")
	public @ResponseBody ArrayList<DiaryDTO> selectdiary(@RequestParam("calendar") String calendar, DiaryDTO diaryDTO, HttpSession session){
		String id = (String)session.getAttribute("id");
		diaryDTO.setCalendar(calendar);
		diaryDTO.setId(id);
		
		ArrayList<DiaryDTO> list = (ArrayList<DiaryDTO>) diarydao.selectDate(diaryDTO);
		
		
		return list;
	}
	
	
	@RequestMapping("diaryselectId.do")
	public @ResponseBody ArrayList<DiaryDTO> selectdiaryid(DiaryDTO diaryDTO, HttpSession session){
		String id = (String)session.getAttribute("id");
		diaryDTO.setId(id);
		
		ArrayList<DiaryDTO> list = (ArrayList<DiaryDTO>) diarydao.selectId(diaryDTO);
		
		
		return list;
	}
	
	
	
}








