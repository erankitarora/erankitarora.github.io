package org.iiitb.sis.admin.student.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.sis.admin.student.action.ShowImage;
import org.iiitb.sis.dto.Student;
import org.iiitb.sis.util.ConnectionPool;


public class SearchStudentModel {
	
	private String rollno;
	private String input_type;
	private ArrayList<Student> list = new ArrayList<Student>();	
	private int length;
	private String uname;
	private String upwd;
	private String place;
	private int isactive;
	private int sid;
	private List<String> semesters=new ArrayList<String>();
	private String currentsem;
		
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
		Student stu_temp = null;
		//input_type="Update";
					
		try
		{
			//Db data = new Db();
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			String query = "select sid,sname,dob,email,phno,lastdegree,currentsem,BirthPlace007 from student where rollno=?";
			org.iiitb.sis.admin.student.action.ShowImage.rollno=rollno;
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, getRollno());
			rs = preparedStatement.executeQuery();

			if(rs.next())
			{
				stu_temp=new Student();
				stu_temp.setSid(rs.getInt(1));
				setSid(rs.getInt(1));
				stu_temp.setName(rs.getString(2));
				stu_temp.setDob(rs.getString(3));
				stu_temp.setEmail(rs.getString(4));
				stu_temp.setPhno(rs.getString(5));
				stu_temp.setLastdegree(rs.getString(6));
				stu_temp.setRollno(getRollno());
				stu_temp.setCurrentsem(rs.getInt(7));
				stu_temp.setPlace(rs.getString(8));
				setCurrentsem(rs.getString(7));
				setStudent(stu_temp);
			}
			setLength(getList().size());
			
			String getUserDetails = "select uname,upwd,isactive from user where userid=?";
			preparedStatement = conn.prepareStatement(getUserDetails);
			preparedStatement.setInt(1,getList().get(0).getSid());
			rs = preparedStatement.executeQuery();
			
			if(rs.next())
			{
				setUname(rs.getString(1));
				setUpwd(rs.getString(2));
				setIsactive(rs.getInt(3));
			}
			
			query = "select semname from sem_master";
			preparedStatement = conn.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			while(rs.next())
			{
				setSemesters(rs.getString(1));
				System.out.println(rs.getString(1));
			}
			
			//System.out.println(user_list.get(0).getUname()+" "+user_list.get(0).getUpwd()+" "+user_list.get(0).getIsactive() + " " + user_list.get(0).getUserid());
				
		    data.freeConnection(conn);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		if(getInput_type().equals("Update"))
			return "Update";
		else
			return "Delete";
	}
	
	public void getListAll()
	{
		ResultSet rs;
		ShowImage.rollno=rollno;
		Student stu_temp = null;
						
		try
		{
			//Db data = new Db();
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			String query = "select rollno,sname from student where rollno LIKE ?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, "%"+getRollno()+"%");
			rs = preparedStatement.executeQuery();

			while(rs.next())
			{
				stu_temp=new Student();
				stu_temp.setRollno(rs.getString(1));
				stu_temp.setName(rs.getString(2));
				System.out.println(rs.getString(1) + " " + rs.getString(2));
				setStudent(stu_temp);
			}
			setLength(getList().size());
			
			query = "select semname from sem_master";
			preparedStatement = conn.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			while(rs.next())
			{
				setSemesters(rs.getString(1));
				System.out.println(rs.getString(1));
			}

			data.freeConnection(conn);
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

	public ArrayList<Student> getList() {
		return list;
	}

	public void setStudent(Student stu) {
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

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public List<String> getSemesters() {
		return semesters;
	}

	public void setSemesters(String semester) {
		semesters.add(semester);
	}

	public String getCurrentsem() {
		return currentsem;
	}

	public void setCurrentsem(String currentsem) {
		this.currentsem = currentsem;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

}
