package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Doctor;

public class DoctorDao  {
	private Connection con;

	public DoctorDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean registerDoctor(Doctor d) {
		boolean f= false;
		
		try {
			String sql = "INSERT INTO doctor (full_name, dob, qualification, speciallist, email, mob_no, password)"
					+ " values(?,?,?,?,?,?,?)";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1,d.getFullName());
			p.setString(2,d.getDob());
			p.setString(3,d.getQualification());
			p.setString(4,d.getSpeciallist());
			p.setString(5,d.getEmail());
			p.setString(6,d.getMobNo());
			p.setString(7,d.getPassword());
			
			int i= p.executeUpdate();
			
			if(i==1) {
				f=true;
			}
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
		
		
	}
	

}
