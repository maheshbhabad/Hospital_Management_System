package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class Userdao {
	
	private Connection con;

	public Userdao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean register(User u) {
		boolean f= false;
		
		try {
			String sql = "insert into user_dts(fullName ,email ,password) values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,u.getFullName());
			ps.setString(2,u.getEmail());
			ps.setString(3,u.getPassword());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;

	}
	
	public User login(String em,String ps) {
		
		User u = null;
		
		try {
			String sql="select * from user_dts where email=? and password=?";
			PreparedStatement p=con.prepareStatement(sql);
			p.setString(1,em);
			p.setString(2, ps);
			
			ResultSet rs=p.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return u ;
		
	}
}
