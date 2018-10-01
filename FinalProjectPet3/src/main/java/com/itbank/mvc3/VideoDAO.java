package com.itbank.mvc3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class VideoDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	DBConnectionMgr pool;
	
	public VideoDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public VideoDTO select(int no) throws Exception {
		con = pool.getConnection();
		
		String sql = "select * from video where no = ?";
		
		ps = con.prepareStatement(sql);
		
		ps.setInt(1, no);
		
		rs = ps.executeQuery();
		VideoDTO dto = null;
		while(rs.next()) {
			dto = new VideoDTO();
			
			dto.setNo(rs.getInt(1));
			dto.setSrc(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setViews(rs.getString(4));
		}
		
		pool.freeConnection(con, ps);
		
		return dto;
	}
	
	public ArrayList<VideoDTO> selectAll(int no) throws Exception {
		con = pool.getConnection();
		
		String sql = "select * from video where no not in (?) limit ?,4";
		
		ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		if(no <= 3) {
			ps.setInt(2, 0);
		}else if(no>=8) {
			ps.setInt(2, 5);
		}else {
			ps.setInt(2, no-3);
		}
		rs = ps.executeQuery();
	
		ArrayList<VideoDTO> list = new ArrayList<VideoDTO>();
		while(rs.next()) {
			VideoDTO dto = new VideoDTO();
			
			dto.setNo(rs.getInt(1));
			dto.setSrc(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setViews(rs.getString(4));
		
			list.add(dto);
		}
		
		pool.freeConnection(con, ps);
		
		return list;
	}
	
	public int IframeCount(){
		  int cnt=0;
		  try{
		   con = pool.getConnection();
		   String sql = "select count(*) from video";
		   ps = con.prepareStatement(sql);
		   rs = ps.executeQuery();
		   rs.next();
		   cnt = rs.getInt("count(*)");
		  }catch(Exception e){
		   e.printStackTrace();
		  }finally{
		   pool.freeConnection(con,ps);
		  }
		  return cnt;
		 }
	
}
