package com.itbank.mvc3;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InterestDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	
	public void insert(InterestDTO dto) {
		myBatis.insert("intSQL.insert", dto);
	}

	public void delete(InterestDTO dto) {
		myBatis.delete("intSQL.delete", dto);
	}

	public void update(InterestDTO dto) {
		myBatis.update("intSQL.update", dto);
	}

	public InterestDTO selectId(String id) {
		return myBatis.selectOne("intSQL.select", id);
	}
	
	public InterestDTO select(InterestDTO dto) {
		return myBatis.selectOne("intSQL.select", dto);
	}

	public List<InterestDTO> selectAll() {
		return myBatis.selectList("intSQL.selectAll");
	}
}
