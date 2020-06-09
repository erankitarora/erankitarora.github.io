package org.iiitb.sis.admin.enrollment.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.iiitb.sis.util.ConnectionPool;

public class ShowCourses
{
	private String cname;
	private ArrayList<String> sname = new ArrayList<String>();;
	
	public String execute()
	{   
		System.out.println("i am at right place selecting student");
		ConnectionPool data = new ConnectionPool();
		PreparedStatement ps;
		int i;
		Connection conn = data.getConnection();	
		try 
		{
			//if(getCname().equals("default"))
			//{
			//	ps=conn.prepareStatement("select sname from student");
		//	}
			//else
		//	{
				ps=conn.prepareStatement("select sname from student where sid NOT IN(select sid from enrollment T where cid=(select cid from courses F where cname=?))");
				ps.setString(1, getCname());
		//	}
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				setSname((rs.getString(1)));
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
	
	

	public ArrayList<String> getSname() {
		return sname;
	}

	public void setSname(String name) {
		sname.add(name);
	}



	public String getCname() {
		return cname;
	}



	public void setCname(String cname) {
		this.cname = cname;
	}
}
