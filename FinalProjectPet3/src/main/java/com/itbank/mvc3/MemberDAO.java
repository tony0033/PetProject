package com.itbank.mvc3;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	
	public void insert(MemberDTO dto) {
		myBatis.insert("memSQL.insert", dto);
	}

	public void delete(MemberDTO dto) {
		myBatis.delete("memSQL.delete", dto);
	}

	public void update(MemberDTO dto) {
		myBatis.update("memSQL.update", dto);
	}

	public MemberDTO selectId(String id) {
		return myBatis.selectOne("memSQL.select", id);
	}
	
	public MemberDTO select(MemberDTO dto) {
		return myBatis.selectOne("memSQL.select", dto);
	}

	public List<MemberDTO> selectAll() {
		return myBatis.selectList("memSQL.selectAll");
	}
}
