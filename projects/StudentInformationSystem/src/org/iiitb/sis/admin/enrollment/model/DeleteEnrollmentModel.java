package org.iiitb.sis.admin.enrollment.model;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.iiitb.sis.util.ConnectionPool;

public class DeleteEnrollmentModel{

	private String sname;
	private String cname;

    public String executeDelete()
	{
    	ResultSet rs;
    	String cid=null,sid=null;
		try
		{
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			
			String query="select cid from courses where cname=?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, getCname());
			rs = preparedStatement.executeQuery();
			
			if(rs.next())
			{
				cid=rs.getString(1);
			}
			
			query="select sid from student where sname=?";
			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, getSname());
			rs = preparedStatement.executeQuery();
			
			if(rs.next())
			{
				sid=rs.getString(1);
			}
			
			String delete_assignment = "delete from enrollment where sid=? and cid=?";
			preparedStatement = conn.prepareStatement(delete_assignment);
			preparedStatement.setString(1,sid);
			preparedStatement.setString(2,cid);
			preparedStatement.execute();
			data.freeConnection(conn);
			return "success";
		}
		catch(Exception e)
		{
			System.out.println(e);
			return "error_user";
		}
	}

	

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
}