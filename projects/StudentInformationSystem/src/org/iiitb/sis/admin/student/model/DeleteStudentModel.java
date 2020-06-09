package org.iiitb.sis.admin.student.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.iiitb.sis.util.ConnectionPool;

public class DeleteStudentModel{

	private int sid;

    public void executeDelete()
	{
		try
		{
			//Db data = new Db();
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			String delete_student = "update user set isactive=0 where userid=?";
			PreparedStatement preparedStatement = conn.prepareStatement(delete_student);
			preparedStatement.setInt(1,getSid());
			preparedStatement.execute();
			data.freeConnection(conn);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}
}