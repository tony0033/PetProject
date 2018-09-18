package com.itbank.mvc3;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	
	public void insert(ProductDTO dto) {
		myBatis.insert("proSQL.insert", dto);
	}

	public void delete(ProductDTO dto) {
		myBatis.delete("proSQL.delete", dto);
	}

	public void update(ProductDTO dto) {
		myBatis.update("proSQL.update", dto);
	}

	public ProductDTO select(ProductDTO dto) {
		return myBatis.selectOne("proSQL.select", dto);
	}

	public List<ProductDTO> selectAll() {
		return myBatis.selectList("proSQL.selectAll");
	}
}
