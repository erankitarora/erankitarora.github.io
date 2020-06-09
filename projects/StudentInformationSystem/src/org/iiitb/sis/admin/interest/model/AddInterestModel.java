package org.iiitb.sis.admin.interest.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;

import com.opensymphony.xwork2.ActionSupport;


public class AddInterestModel extends ActionSupport{

	private String interest;
	
	public String assign()
	{
		try
		{
			//Db data = new Db();
			
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			PreparedStatement preparedStatement;
			System.out.println(interest);			
			String interest_query = "insert into interest_master(InterestName) values(?)";
			
			preparedStatement = conn.prepareStatement(interest_query);
			
			preparedStatement.setString(1,getInterest());
			preparedStatement.execute();
			
			data.freeConnection(conn);
			ServletActionContext.getResponse().addHeader("msg", "Data Has been Inserted Sucessfully");
			return "success";
		}catch(Exception e)
		{
			System.out.println(e);
			ServletActionContext.getResponse().addHeader("msg", "Error in inserting data");
			return "success";
		}
		
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

}
