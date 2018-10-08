package com.itbank.mvc3;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VideoDAO {
		
	@Autowired
	SqlSessionTemplate myBatis;
	
	public VideoDTO select(NumDTO dto) {
		return myBatis.selectOne("videoSQL.select", dto);
	}

	public ArrayList<VideoDTO> selectAll(NumDTO dto) throws Exception {
		return myBatis.selectOne("videoSQL.selectAll", dto);
	}
	
	public int IframeCount(){
		  return myBatis.selectOne("videoSQL.selectCount");
	}
	
}
