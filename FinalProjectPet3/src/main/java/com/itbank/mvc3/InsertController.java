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
		
		
		//1. MemberDTO��ü ����
		//2. �Ķ���� �޾� �ְ�
		//3. �Ķ���� ���� ���� MemberDTO�� ������ set
		//4. Model��ü ����->�Ӽ����� �ڵ� ���
		
		//memberDAO.insert(memberDTO);
		System.out.println(memberDTO.getId());
		return "insertResult";
	}
}








