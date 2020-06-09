package org.iiitb.sis.admin.faculty.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.dto.Faculty;
import org.iiitb.sis.util.ConnectionPool;

import org.iiitb.sis.util.Constants;


public class DeleteFacultyModel{

	private String rollno;
	private int fid;

    public void executeDelete()
	{  
    	System.out.println("Data has been recived to delete");
    	System.out.println(rollno);
    	System.out.println("");
    	ResultSet rs;
		try
		{   System.out.println(getRollno());
		Connection con=ConnectionPool.getConnection();	
		//Db data = new Db();
		//ConnectionPool data=new ConnectionPool(); 
		//java.sql.Connection con= data.getConnection();
			String select_userid = "select fid from faculty where fcode=?";
			String delete_faculty = "update user set isactive=0 where userid=?";
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(select_userid);
			preparedStatement.setString(1,getRollno());
			
			rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				setFid(rs.getInt(1));
		    }
			System.out.println(getFid());
			PreparedStatement preparedStatement1 = (PreparedStatement) con.prepareStatement(delete_faculty);
			preparedStatement1.setInt(1,getFid());
			preparedStatement1.executeUpdate();
			ServletActionContext.getResponse().addHeader("msg", "Data Has been Deleted	");
			//data.con.close();
			ConnectionPool.freeConnection(con);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	public String getRollno() {
		return rollno;
	}

	public void setRollno(String rollno) {
		this.rollno = rollno;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	
}