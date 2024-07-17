package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class appointmentDao {
	private Connection con;

	public appointmentDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addAppointment(Appointment ap) {

		boolean f = false;

		try {
			String sql = "insert into appointment(userId,fullName,gender,age,appoinDate,email,phNo,diseases,doctorId,address,status)values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement p = con.prepareStatement(sql);
			p.setInt(1, ap.getUserId());
			p.setString(2, ap.getFullName());
			p.setString(3, ap.getGender());
			p.setString(4, ap.getAge());
			p.setString(5, ap.getAppoinDate());
			p.setString(6, ap.getEmail());
			p.setString(7, ap.getPhNo());
			p.setString(8, ap.getDiseases());
			p.setInt(9, ap.getDoctorId());
			p.setString(10, ap.getAddress());
			p.setString(11, ap.getStatus());
			int i = p.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("dao test");
		return f;
	}

	public List<Appointment> getAllAppointmentByLoginUser(int userId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;

		try {
			String sql = "select * from appointment where userId=? ";
			PreparedStatement p = con.prepareStatement(sql);

			p.setInt(1, userId);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				list.add(ap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;

		try {
			String sql = "select * from appointment where doctorId=? ";
			PreparedStatement p = con.prepareStatement(sql);

			p.setInt(1, doctorId);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				list.add(ap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Appointment getAppointmentsById(int id) {

		Appointment ap = null;

		try {
			String sql = "select * from appointment where id=? ";
			PreparedStatement p = con.prepareStatement(sql);

			p.setInt(1, id);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ap;
	}

	public boolean updateComment(int id, int doctorId, String comment) {

		boolean f = false;
		try {
			String sql = "update appointment set status=? where id=? and doctorId=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, comment);
			ps.setInt(2, id);
			ps.setInt(3, doctorId);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Appointment> getAllAppointment() {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;

		try {
			String sql = "select * from appointment order by id desc";
			PreparedStatement p = con.prepareStatement(sql);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				list.add(ap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
