package org.iiitb.sis.admin.course.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.iiitb.sis.admin.course.model.getCourseDetail;
import org.iiitb.sis.util.ConnectionPool;

public class courseDetailService  {

	public String call(getCourseDetail gcd) throws SQLException {
		
		String res=checkIfExist(gcd);
		if(res.equals("success"))
		{
			gcd.search();
			return res;
		}
		else
			return res;
		
		
	}

	
	public String checkIfExist(getCourseDetail gcd) throws SQLException
	{
		ConnectionPool data=new ConnectionPool();
		java.sql.Connection con= data.getConnection();
		
		PreparedStatement ps = null;
		int count=0;
		ps=con.prepareStatement("Select * from courses where ccode = ?");
		ps.setString(1, gcd.getCcode());
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			count++;
		}
	
		if(count==0)
		return "error";
		else
		return 
		"success";
	}


	public String calllist(getCourseDetail gcd) throws SQLException {
		String res=gcd.searchlist();
		return "success";
	}

}
