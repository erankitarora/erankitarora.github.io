package org.iiitb.sis.admin.course.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.iiitb.sis.dto.courses;
import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.admin.course.model.*;;


public class courseAddService {
	
	public String check(courses ob) throws SQLException 
	{
		String res=checkDuplicate(ob);
		if(res.equals("success"))
		{	
			connection connect=new connection();
			connect.AddEntry(ob);
			return "success";
		}
		else
			return "error";
	}
	public String checkDuplicate(courses ob2) throws SQLException
	{
		ConnectionPool data=new ConnectionPool();
		java.sql.Connection con= data.getConnection();
		
		PreparedStatement ps = null;
		int count=0;
		ps=con.prepareStatement("Select * from courses where ccode = ?");
		ps.setString(1, ob2.getCcode());
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			count++;
		}
		 ConnectionPool.freeConnection(con);
		if(count==0)
			return "success";
		else
			return 
					"error";
	}

}
