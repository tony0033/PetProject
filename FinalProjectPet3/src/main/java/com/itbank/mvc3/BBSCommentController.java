package com.itbank.mvc3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BBSCommentController {

	@Autowired
	BBSCommentDAO bbsCommentDAO;

	@RequestMapping("bbsComment")
	@ResponseBody
	public String bbsCommentInsert(BBSCommentDTO bbsCommentDTO, Model model) {
		bbsCommentDAO.insert(bbsCommentDTO);
		
		return "bbsOpen";
	}
	
}
