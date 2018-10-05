package com.itbank.mvc3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VideoDAO {
		
	@Autowired
	SqlSessionTemplate myBatis;
	
	public VideoDTO select(int pageNum) {
		return myBatis.selectOne("videoSQL.select",pageNum);
	}
	
	public ArrayList<VideoDTO> selectAll(int no, int start, int end) throws Exception {
		return myBatis.selectOne("videoSQL.selectAll");
	}
	
	public int IframeCount(){
		  return myBatis.selectOne("videoSQL.selectCount");
	}
	
}
