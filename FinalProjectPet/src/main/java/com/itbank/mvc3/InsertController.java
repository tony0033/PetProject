package com.itbank.mvc3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InsertController {

	@Autowired
	MemberDAO dao;
	
	@RequestMapping("insert2.do")
	public String insert2( MemberDTO memberDTO) {
		System.out.println(memberDTO.getId());
		dao.insert(memberDTO);
		return "insertResult";
	}
	
	@RequestMapping("insert.do")
	public String insert(MemberDAO memberDAO, MemberDTO memberDTO) {
		
		
		//1. MemberDTO객체 생성
		//2. 파라메터 받아 주고
		//3. 파라메터 받은 값을 MemberDTO의 변수에 set
		//4. Model객체 생성->속성으로 자동 등록
		
		//memberDAO.insert(memberDTO);
		System.out.println(memberDTO.getId());
		return "insertResult";
	}
}








