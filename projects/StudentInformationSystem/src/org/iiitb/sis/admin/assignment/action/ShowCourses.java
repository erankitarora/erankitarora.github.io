package org.iiitb.sis.admin.assignment.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.iiitb.sis.util.ConnectionPool;

public class ShowCourses
{
	private String fname;
	private ArrayList<String> cname = new ArrayList<String>();;
	
	public String execute()
	{
		ConnectionPool data = new ConnectionPool();
		PreparedStatement ps;
		int i;
		Connection conn = data.getConnection();	
		try 
		{
			if(getFname().equals("default"))
			{
				ps=conn.prepareStatement("select cname from courses");
			}
			else
			{
				ps=conn.prepareStatement("select cname from courses where cid NOT IN(select cid from teaches T where fid=(select fid from faculty F where fname=?))");
				ps.setString(1, getFname());
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
	
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public ArrayList<String> getCname() {
		return cname;
	}

	public void setCname(String name) {
		cname.add(name);
	}
}
