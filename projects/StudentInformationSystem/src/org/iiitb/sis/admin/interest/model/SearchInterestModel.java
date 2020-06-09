package org.iiitb.sis.admin.interest.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.sis.dto.Student;
import org.iiitb.sis.util.ConnectionPool;

public class SearchInterestModel {
	
	private String interest;
	private String selectedInterest;
	private String input_type;
	private ArrayList<Interest> list = new ArrayList<Interest>();

	public void getListAll()
	{
		ResultSet rs;
					
		try
		{
			//Db data = new Db();
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			String query = "select InterestName from interest_master where InterestName LIKE ?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, "%"+getSelectedInterest()+"%");
			rs = preparedStatement.executeQuery();
			while(rs.next())
			{
				Interest int1 = new Interest();
				int1.setSelectedInterest(rs.getString(1));
				int1.setInterest(rs.getString(1));
				setList(int1);
			}			
			data.freeConnection(conn);			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getSelectedInterest() {
		return selectedInterest;
	}

	public void setSelectedInterest(String selectedInterest) {
		this.selectedInterest = selectedInterest;
	}

	public String getInput_type() {
		return input_type;
	}

	public void setInput_type(String input_type) {
		this.input_type = input_type;
	}

	public ArrayList<Interest> getList() {
		return list;
	}

	public void setList(Interest assign) {
		list.add(assign);
	}
}
