package org.iiitb.sis.studenthome.action;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ConfirmFriend extends ActionSupport 
{
	private static final long serialVersionUID = -7056718679108161765L;
	
	private int sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
	Connection con;
	private int userid;
	
	public String confirmfriend()
	{
		try 
		{
			System.out.println("i am at right place");
			con=ConnectionPool.getConnection();
			String update_user;
			update_user= "update friends set status=1 where sid=? and sid1=?";
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(update_user);

			preparedStatement.setInt(1,getUserid());
			preparedStatement.setInt(2,getSid());
			preparedStatement.execute();
			System.out.println("yuu updated");
			ServletActionContext.getResponse().addHeader("msg", "Data Has been Updated Sucessfully");
			return "success";
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			ConnectionPool.freeConnection(con);
		    return "error";
		} 
	}
	
	public String rejectfriend()
	{
		try 
		{
			System.out.println("i am at rejecting frnd");
			con=ConnectionPool.getConnection();
			String del_user;
			del_user= "delete from friends where sid=? and sid1=?";
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(del_user);

			preparedStatement.setInt(1,getUserid());
			preparedStatement.setInt(2,getSid());
			preparedStatement.execute();
			System.out.println("yuu deleted");
			ServletActionContext.getResponse().addHeader("msg", "Friend has been removed");
			return "success";
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			ConnectionPool.freeConnection(con);
		    return "error";
		} 
	}
	
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
}
