package org.iiitb.sis.admin.faculty.model;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;


import org.iiitb.sis.admin.faculty.action.ShowImage;
import org.iiitb.sis.dto.Faculty;
import org.iiitb.sis.dto.User;
import org.iiitb.sis.util.ConnectionPool;

import org.iiitb.sis.util.Constants;

//import com.mysql.jdbc.PreparedStatement;

public class SearchFacultybynameModel {
	
	private String rollno;
	private ArrayList<Faculty> list = new ArrayList<Faculty>();	
	private String sname;
	
	
	public String getResult()
	{
		ResultSet rs;
		
					
		try
		{    Connection con=ConnectionPool.getConnection();
			//Db data = new Db();
			//ConnectionPool data=new ConnectionPool(); 
			//java.sql.Connection con= data.getConnection();
			String query = "select fid,fcode,fname from faculty,user where faculty.fid=user.userid and user.isactive=1 and fname like '%" + getSname() + "%'";
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(query);
			//preparedStatement = (PreparedStatement) con.prepareStatement(check_user);
			rs = preparedStatement.executeQuery();
			ShowImage.rollno=rollno;	
			while(rs.next())
			{
				Faculty ftu_temp=new Faculty();
				ftu_temp.setFid(rs.getInt(1));
				ftu_temp.setFcode(rs.getString(2));
				ftu_temp.setFname(rs.getString(3));
				//setFaculty(stu_temp);
				list.add(ftu_temp);
				System.out.println(ftu_temp.getFname());
				System.out.println(ftu_temp.getFid());
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



	public String getRollno() {
		return rollno;
	}



	public void setRollno(String rollno) {
		this.rollno = rollno;
	}



	public String getSname() {
		return sname;
	}



	public void setSname(String sname) {
		this.sname = sname;
	}

	public ArrayList<Faculty> getList() {
		return list;
	}



	public void setList(ArrayList<Faculty> list) {
		this.list = list;
	}
}
