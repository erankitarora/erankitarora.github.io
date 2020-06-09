package org.iiitb.sis.admin.assignment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.sis.util.ConnectionPool;


public class UpdateAssignmentModel{

	private String semname;
	private String cname;
	private String fname;
	private List<String> semesters = new ArrayList<String>();
	
	public String assign() {
		ResultSet rs;
		String fid = null,cid = null,semid = null;
		
		try
		{
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			String query="select semid from sem_master where semname=?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, getSemname());
			rs = preparedStatement.executeQuery();
			
			if(rs.next())
			{
				semid=rs.getString(1);
			}

			query="select cid from courses where cname=?";
			preparedStatement = conn.prepareStatement(query);
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
			
			query = "update teaches set semid=? where fid=? and cid=?";
			preparedStatement = conn.prepareStatement(query);
		
			preparedStatement.setString(1,semid);
			preparedStatement.setString(2,fid);
			preparedStatement.setString(3,cid);
			preparedStatement.execute();

			query = "select semname from sem_master";
			preparedStatement = conn.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			while(rs.next())
			{
				setSemesters(rs.getString(1));
			}
			
			data.freeConnection(conn);
			return "success";
		}catch(Exception E)
		{
			System.out.println(E);
			return "error_user";
		}
	}
	public String getSemname() {
		return semname;
	}
	public void setSemname(String semname) {
		this.semname = semname;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public List<String> getSemesters() {
		return semesters;
	}
	public void setSemesters(String semester) {
		semesters.add(semester);
	}
}