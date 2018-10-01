package com.itbank.mvc3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ColumnDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	DBConnectionMgr pool;
	public ColumnDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	public void insert(ColumnDTO dto) throws Exception {
		con = pool.getConnection();
		
		String sql = "insert into address(addr,title) values(?,?)";
		
		ps = con.prepareStatement(sql);
		
		ps.setString(1, dto.getAddr());
		ps.setString(2, dto.getTitle());
		
		ps.executeUpdate();
		
		pool.freeConnection(con, ps);
		
	}
	public ColumnDTO select(String title) throws Exception {
		con = pool.getConnection();
		
		String sql = "select * from address where title = ?";
		
		ps = con.prepareStatement(sql);
		
		ps.setString(1, title);
		
		rs = ps.executeQuery();
		ColumnDTO dto = null;
		while(rs.next()) {
			dto = new ColumnDTO();
			
			dto.setAddr(rs.getString(1));
			dto.setTitle(rs.getString(2));
		}
		
		pool.freeConnection(con, ps);
		
		return dto;
	}
	
	public ArrayList<ColumnDTO> selectAll(ColumnDTO dto) throws Exception {
		con = pool.getConnection();
		
		String sql = "select * from address where no not in (?) limit ?,?";
		
		ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getNo());
		if(dto.getNo() == 0) {
			ps.setInt(2, 1);
			ps.setInt(3, 1);
		}else {
			ps.setInt(2, dto.getNo()-1);
			ps.setInt(3, 2);
		}
		rs = ps.executeQuery();
	
		ArrayList<ColumnDTO> list = new ArrayList<ColumnDTO>();
		while(rs.next()) {
			ColumnDTO dto1 = new ColumnDTO();
			list.add(dto1);
		}
		
		pool.freeConnection(con, ps);
		
		return list;
	}
	public ArrayList<ColumnDTO> selectAll(int start, int end) throws Exception {
		con = pool.getConnection();
		
		String sql = "select * from address order by no desc limit ?,?";
		
		ps = con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);
		rs = ps.executeQuery();
		
		ArrayList<ColumnDTO> list = new ArrayList<ColumnDTO>();
		while(rs.next()) {
			ColumnDTO dto = new ColumnDTO();
			
			dto.setAddr(rs.getString(1));
			dto.setTitle(rs.getString(2));
			dto.setNo(rs.getInt(3));
			
			list.add(dto);
		}
		
		pool.freeConnection(con, ps);
		
		return list;
	}
	
	public int ListCount(){
		int cnt=0;
		int max=0;
		try{
			con = pool.getConnection();
			String sql = "select count(*) from address";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			cnt = rs.getInt("count(*)");
			max = cnt/4;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,ps);
		}
		return max;
	}
	
	public int ColumnCount(){
		  int cnt=0;
		  try{
		   con = pool.getConnection();
		   String sql = "select count(*) from address";
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
