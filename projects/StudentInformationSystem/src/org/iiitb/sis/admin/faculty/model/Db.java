package org.iiitb.sis.admin.faculty.model;
import java.sql.Connection;
import java.sql.DriverManager;


public class Db 
{
	public static Connection con = null;
	public Db()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/sisdb2015", "root", "panda");
		}
		catch(Exception ex)
		{
			System.out.println("SQLException: " + ex.getMessage());
		}
	}
}
