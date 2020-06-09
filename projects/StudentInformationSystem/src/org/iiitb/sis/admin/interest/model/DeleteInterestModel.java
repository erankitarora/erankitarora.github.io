package org.iiitb.sis.admin.interest.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.iiitb.sis.util.ConnectionPool;

public class DeleteInterestModel{

	private String selectedInterest;

    public String executeDelete()
	{
    	ResultSet rs;
    	
		try
		{
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			
			String delete_interest = "delete from interest_master where InterestName=?";
			PreparedStatement preparedStatement = conn.prepareStatement(delete_interest);
			preparedStatement.setString(1,getSelectedInterest());
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

	public String getSelectedInterest() {
		return selectedInterest;
	}

	public void setSelectedInterest(String selectedInterest) {
		this.selectedInterest = selectedInterest;
	}
}