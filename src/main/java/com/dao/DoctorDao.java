package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;
import com.entity.User;

public class DoctorDao {
	private Connection con;

	public DoctorDao(Connection con) {
		super();
		this.con = con;
	}
	public boolean registerDoctor(Doctor d) {
		boolean f = false;

		try {
			String sql = "INSERT INTO doctor (full_name, dob, qualification, specialist, email, mob_no, password)"
					+ " values(?,?,?,?,?,?,?)";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, d.getFullName());
			p.setString(2, d.getDob());
			p.setString(3, d.getQualification());
			p.setString(4, d.getSpeciallist());
			p.setString(5, d.getEmail());
			p.setString(6, d.getMobNo());
			p.setString(7, d.getPassword());

			int i = p.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Doctor> getAllDoctor() {
		List<Doctor> list = new ArrayList<Doctor>();

		Doctor d = null;

		try {
			String sql = "select * from doctor order by id desc";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpeciallist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobNo(rs.getString(7));
				d.setPassword(rs.getString(8));
				list.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Doctor getDoctorById(int id) {

		Doctor d = null;

		try {
			String sql = "select * from doctor where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpeciallist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobNo(rs.getString(7));
				d.setPassword(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	public boolean UpdateDoctor(Doctor d) {
		boolean f = false;

		try {
			String sql = "Update doctor set full_name=?, dob=?, qualification=?, specialist=?, email=?, mob_no=?, password=? where id=?";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, d.getFullName());
			p.setString(2, d.getDob());
			p.setString(3, d.getQualification());
			p.setString(4, d.getSpeciallist());
			p.setString(5, d.getEmail());
			p.setString(6, d.getMobNo());
			p.setString(7, d.getPassword());
			p.setInt(8,d.getId());
			int i = p.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean DeleteDoctor(int id) {
		boolean f = false;

		try {
			String sql = "delete from doctor  where id=?";
			PreparedStatement p = con.prepareStatement(sql);
			p.setInt(1,id);
			int i = p.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
public Doctor Login(String em,String ps) {
		
		Doctor d = null;
		
		try {
			String sql="select * from doctor where email=? and password=?";
			PreparedStatement p=con.prepareStatement(sql);
			p.setString(1,em);
			p.setString(2, ps);
			
			ResultSet rs=p.executeQuery();
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobNo(rs.getString(7));
				d.setPassword(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d ;
		
	}
	public int countAppointment() {
		int i=0;
		try {
			String sql= "select * from appointment";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countUser() {
		int i=0;
		try {
			String sql= "select * from user_dts";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countSpecialist() {
		int i=0;
		try {
			String sql= "select * from specialist";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countDoctor() {
		int i=0;
		try {
			String sql= "select * from doctor";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countAppointmentByDoctor(int did) {
		int i=0;
		try {
			String sql= "select * from appointment where doctorId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, did);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

}
