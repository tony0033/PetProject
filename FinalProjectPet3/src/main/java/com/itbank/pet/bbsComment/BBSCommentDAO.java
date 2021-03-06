package com.itbank.pet.bbsComment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BBSCommentDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	
	public void insert(BBSCommentDTO dto) {
		myBatis.insert("bbsCommentSQL.insert", dto);
	}

	public void delete(BBSCommentDTO dto) {
		myBatis.delete("bbsCommentSQL.delete", dto);
	}

	public void update(BBSCommentDTO dto) {
		myBatis.update("bbsCommentSQL.update", dto);
	}

	public List<BBSCommentDTO> select(BBSCommentDTO dto) {
		return myBatis.selectList("bbsCommentSQL.select", dto);
	}

	public List<BBSCommentDTO> selectAll() {
		return myBatis.selectList("bbsCommentSQL.selectAll");
	}
}
