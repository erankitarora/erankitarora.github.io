package org.iiitb.sis.admin.assignment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.iiitb.sis.util.ConnectionPool;

public class DeleteAssignmentModel{

	private String fname;
	private String cname;

    public String executeDelete()
	{
    	ResultSet rs;
    	String cid=null,fid=null;
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
			
			query="select fid from faculty where fname=?";
			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, getFname());
			rs = preparedStatement.executeQuery();
			
			if(rs.next())
			{
				fid=rs.getString(1);
			}
			
			String delete_assignment = "delete from teaches where fid=? and cid=?";
			preparedStatement = conn.prepareStatement(delete_assignment);
			preparedStatement.setString(1,fid);
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

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}
}