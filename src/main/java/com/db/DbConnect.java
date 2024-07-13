package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect {
	public static Connection myConnection() {
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			//step 2:connection to db
			//connection details :-C:\oraclexe\app\oracle\product\10.2.0\server\NETWORK\ADMIN
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","System","Mahesh1304");
			System.out.println("Connection To DB"+con);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
