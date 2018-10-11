package com.itbank.pet.bbsComment;

import java.util.ArrayList;

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
	public @ResponseBody ArrayList<BBSCommentDTO> bbsCommentInsert(BBSCommentDTO bbsCommentDTO, Model model) {
		bbsCommentDAO.insert(bbsCommentDTO);
		ArrayList<BBSCommentDTO> commentList = (ArrayList<BBSCommentDTO>) bbsCommentDAO.select(bbsCommentDTO);
		model.addAttribute("commentList", commentList);
		
		return commentList;
	}
	
	@RequestMapping("bbsCommentList")
	public @ResponseBody ArrayList<BBSCommentDTO> bbsCommentSelect(BBSCommentDTO bbsCommentDTO, Model model){
		ArrayList<BBSCommentDTO> commentList = (ArrayList<BBSCommentDTO>) bbsCommentDAO.select(bbsCommentDTO);
		model.addAttribute("commentList", commentList);
		
		return commentList;
	}
	
	@RequestMapping("bbsCommentDelete")
	public @ResponseBody ArrayList<BBSCommentDTO> bbsCommentDelete(BBSCommentDTO bbsCommentDTO, Model model) {
		bbsCommentDAO.delete(bbsCommentDTO);
		ArrayList<BBSCommentDTO> commentList = (ArrayList<BBSCommentDTO>) bbsCommentDAO.select(bbsCommentDTO);
		model.addAttribute("commentList", commentList);
		
		return commentList;
	}
}
