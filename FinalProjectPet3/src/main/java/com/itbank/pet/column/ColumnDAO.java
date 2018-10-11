package com.itbank.pet.column;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ColumnDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	public void insert(ColumnDTO dto){
		myBatis.insert("columnSQL.insert", dto);
	}
	
	public ColumnDTO select(ColumnDTO dto){
		return myBatis.selectOne("columnSQL.select", dto);
	}
	
	public List<ColumnDTO> selectAll(NumDTO dto){
		return myBatis.selectList("columnSQL.selectAll", dto);
	}
	
	public int ColumnCount(){
		 return myBatis.selectOne("columnSQL.selectCount");
	}
	
}
