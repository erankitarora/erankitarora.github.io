package org.iiitb.sis.admin.enrollment.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.sis.util.ConnectionPool;


public class UpdateEnrollmentModel{

	private String semname;
	private String cname;
	private String sname;
	private List<String> semesters = new ArrayList<String>();
	
	public String assign() {
		ResultSet rs;
		String sid = null,cid = null,semid = null;
		
		try
		{
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			//String query="select semid from sem_master where semname=?";
			//PreparedStatement preparedStatement = conn.prepareStatement(query);
			//preparedStatement.setString(1, getSemname());
			//rs = preparedStatement.executeQuery();
			
			//if(rs.next())
		//	{
			//	semid=rs.getString(1);
			//}

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
			
			query = "update enrollment set sem=? where sid=? and cid=?";
			preparedStatement = conn.prepareStatement(query);
		
			preparedStatement.setString(1,getSemname());
			preparedStatement.setString(2,sid);
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
	
	public List<String> getSemesters() {
		return semesters;
	}
	public void setSemesters(String semester) {
		semesters.add(semester);
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
}