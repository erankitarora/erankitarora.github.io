package org.iiitb.sis.admin.faculty.model;


import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.sql.ResultSet;
import java.sql.PreparedStatement;

import org.iiitb.sis.admin.faculty.action.ShowImage;
import org.iiitb.sis.dto.Faculty;
import org.iiitb.sis.dto.User;
import org.iiitb.sis.util.ConnectionPool;

import org.iiitb.sis.util.Constants;

//import com.mysql.jdbc.PreparedStatement;

public class SearchFacultyModel {
	
	private String rollno;
	private String input_type;
	private ArrayList<Faculty> list = new ArrayList<Faculty>();	
	private ArrayList<Integer> list_active = new ArrayList<Integer>();
	private int length;
	private int length_user;
	private String uname;
	private String upwd;
	private int isactive;
	private int fid;
		
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public int getIsactive() {
		return isactive;
	}

	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}

	public String getResult()
	{
		ResultSet rs;
		ShowImage.rollno=rollno;
		System.out.println("Hello The roll Number is");
		System.out.println(rollno);
		Faculty ftu_temp = null;
					
		try
		{
			//Db data = new Db();
			//ConnectionPool data=new ConnectionPool(); 
			//java.sql.Connection con= data.getConnection();
			Connection con=ConnectionPool.getConnection();
			String query = "select fid,fname,doj,phno,email,fcode from faculty where fcode=?";
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(query);
			preparedStatement.setString(1,rollno);
			rs = preparedStatement.executeQuery();

			if(rs.next())
			{
				ftu_temp=new Faculty();
				
				System.out.println(rs.getInt(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getDate(3));
				System.out.println(rs.getString(4));
				System.out.println(rs.getString(5));
				System.out.println(rs.getString(6));

				ftu_temp.setFid(rs.getInt(1));
				setFid(rs.getInt(1));
				ftu_temp.setFname(rs.getString(2));
				ftu_temp.setDoj(rs.getDate(3));
				ftu_temp.setEmail(rs.getString(5));
				ftu_temp.setPhno(rs.getString(4));
				ftu_temp.setFcode(rs.getString(6));
				setFaculty(ftu_temp);
			}
			setLength(getList().size());
			
			String getUserDetails = "select uname,upwd,isactive,userimage from user where userid=?";
			preparedStatement = (PreparedStatement) con.prepareStatement(getUserDetails);
			preparedStatement.setInt(1,getList().get(0).getFid());
			rs = preparedStatement.executeQuery();
			
			if(rs.next())
			{
				setUname(rs.getString(1));
				setUpwd(rs.getString(2));
				setIsactive(rs.getInt(3));
			}
			
			//System.out.println(user_list.get(0).getUname()+" "+user_list.get(0).getUpwd()+" "+user_list.get(0).getIsactive() + " " + user_list.get(0).getUserid());
				
			ConnectionPool.freeConnection(con);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
			return "Update";
		
	}

	

	public ArrayList<Faculty> getList() {
		return list;
	}

	public void setFaculty(Faculty stu) {
		 list.add(stu);
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public String getInput_type() {
		return input_type;
	}

	public void setInput_type(String input_type) {
		this.input_type = input_type;
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
