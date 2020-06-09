package org.iiitb.sis.admin.enrollment.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.iiitb.sis.util.ConnectionPool;

public class ShowSem  {

	
	private String semname;
	private ArrayList<String> cname = new ArrayList<String>();;
	
	public String execute()
	{   
		//return "success";
		//System.out.println();
		//System.out.println("i am at right place selecting Course");

		ConnectionPool data = new ConnectionPool();
		PreparedStatement ps;
		int i;
		Connection conn = data.getConnection();	
		try 
		{
			if(getSemname().equals("default"))
			{
				ps=conn.prepareStatement("select cname from courses");
			}
			else
			{
				ps=conn.prepareStatement("select cname from courses where semid=?");
				ps.setString(1, getSemname());
			}
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				setCname((rs.getString(1)));
			}
			ps.close();
			rs.close();
			data.freeConnection(conn);	
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return "success";
	}

	public String getSemname() {
		return semname;
	}

	public void setSemname(String semname) {
		this.semname = semname;
	}

	public ArrayList<String> getCname() {
		return cname;
	}

	public void setCname(String name) {
		cname.add(name);
	}
	
	

	
}
