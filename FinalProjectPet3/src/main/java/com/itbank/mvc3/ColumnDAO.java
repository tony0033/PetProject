package com.itbank.mvc3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	/*public ArrayList<ColumnDTO> selectAll(ColumnDTO dto) throws Exception {
		
		String sql = "select * from address where no not in (?) limit ?,?";
		
		if(dto.getNo() == 0) {
			ps.setInt(2, 1);
			ps.setInt(3, 1);
		}else {
			ps.setInt(2, dto.getNo()-1);
			ps.setInt(3, 2);
		}
		rs = ps.executeQuery();
	
	}*/
	public ArrayList<ColumnDTO> selectAll(int start,int end){
		return myBatis.selectOne("columnSQL.selectAll");
	}
	
	public int ColumnCount(){
		 return myBatis.selectOne("columnSQL.selectCount");
	}
	
}
