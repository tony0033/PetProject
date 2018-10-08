package com.itbank.mvc3;

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
	public List<ColumnDTO> selectAll(NumDTO dto){
		return myBatis.selectList("columnSQL.selectAll", dto);
	}
	
	public int ColumnCount(){
		 return myBatis.selectOne("columnSQL.selectCount");
	}
	
}
