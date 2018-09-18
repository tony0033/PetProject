package com.itbank.mvc3;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DiaryDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	
	public void insert(DiaryDTO dto) {
		myBatis.insert("diarySQL.insert", dto);
	}

	public void delete(DiaryDTO dto) {
		myBatis.delete("diarySQL.delete", dto);
	}

	public void update(DiaryDTO dto) {
		myBatis.update("diarySQL.update", dto);
	}

	public DiaryDTO select(DiaryDTO dto) {
		return myBatis.selectOne("diarySQL.select", dto);
	}

	public List<DiaryDTO> selectAll() {
		return myBatis.selectList("diarySQL.selectAll");
	}
}
