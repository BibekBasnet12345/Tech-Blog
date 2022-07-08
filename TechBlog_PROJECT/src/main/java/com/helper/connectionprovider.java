package com.helper;
import java.sql.Connection;
import java.sql.DriverManager;
public class connectionprovider
{
private  static Connection con;
public static Connection getCon() {
	try {
		if (con==null) {
			//driverclass load
			Class.forName("com.mysql.jdbc.Driver");
			//create a connection
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","cherry"); 
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return con;
}

public static void setCon(Connection con) {
	connectionprovider.con = con;
}

}
