package com.itbank.mvc3;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BBSDAO {

	@Autowired
	SqlSessionTemplate myBatis;

	public void insert(BBSDTO dto) {
		myBatis.insert("bbsSQL.insert", dto);
	}

	public void delete(BBSDTO dto) {
		myBatis.delete("bbsSQL.delete", dto);
	}

	public void update(BBSDTO dto) {
		myBatis.update("bbsSQL.update", dto);
	}

	public BBSDTO select(BBSDTO dto) {
		return myBatis.selectOne("bbsSQL.select", dto);
	}

	public List<BBSDTO> selectAll() {
		return myBatis.selectList("bbsSQL.selectAll");
	}

	public void bbsReadUpdate(int bView) {
		myBatis.update("bbsReadUpdate", bView);
	}
}
