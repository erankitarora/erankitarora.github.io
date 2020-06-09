package org.iiitb.sis.admin.student.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.iiitb.sis.util.ConnectionPool;


public class AddStudentModel  implements ServletRequestAware{

	private String name;
	private String rollno;
	private String email;
	private String phno;
	private String dob;
	private String place;
	private String lastdegree;
	private int currentsem;
	private File image;
    private String imageContentType;
    private String imageFileName;
    HttpServletRequest servletRequest;
    private String uname;
    private String upwd;
    private int isactive;
    
    public String assign()
	{
		try
		{
			//Db data = new Db();
			Connection conn=ConnectionPool.getConnection();
			String destpath = null;
			PreparedStatement preparedStatement;
			ResultSet rs;
			String add_user;
			int userid = 0;
			int count=0;
			String check_user="select uname from user where uname=?";
			preparedStatement = conn.prepareStatement(check_user);
			preparedStatement.setString(1,getUname());
			rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				count++;
			}
			check_user="select rollno from student where rollno=?";
			preparedStatement = conn.prepareStatement(check_user);
			preparedStatement.setString(1,getRollno());
			rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				count++;
			}
			ConnectionPool.freeConnection(conn);
			if(count==0)
			{
				conn=ConnectionPool.getConnection();
				if(getImage()!=null)
				{
					add_user = "insert into user(uname,upwd,isactive,utype,userimage) values(?,?,?,?,?)";
				}
				else
				{	
					add_user= "insert into user(uname,upwd,isactive,utype) values(?,?,?,?)";
				}
				preparedStatement = conn.prepareStatement(add_user);
				preparedStatement.setString(1,getUname());
				preparedStatement.setString(2,getUpwd());
				preparedStatement.setInt(3,getIsactive());
				preparedStatement.setString(4,"student");
				if(getImage()!=null)
				{
					try
					{
						destpath=this.getClass().getResource("/").getPath();
						System.out.println("Server path:" + destpath);
					}
					catch(Exception E)
					{
						System.out.println("Exception in destination path");
					}
					File destFile = new File(destpath, getImageFileName());
					try 
					{
						FileUtils.copyFile(getImage(), destFile);
					} catch (IOException e)
					{
						e.printStackTrace();
					}
					FileInputStream inputStream = new FileInputStream(destFile);
					preparedStatement.setBinaryStream(5,inputStream,(int)getImage().length());
				}
				preparedStatement.execute();
				
				//added user
				
				String get_userid = "select userid from user where uname=?";
				preparedStatement = conn.prepareStatement(get_userid);
				preparedStatement.setString(1,getUname());
				rs = preparedStatement.executeQuery();
				
				if(rs.next())
				{
					userid=rs.getInt(1);
				}
				
				//got the userid
				
				String add_student = "insert into student(sid,sname,dob,email,phno,lastdegree,rollno,currentsem,BirthPlace007) values(?,?,?,?,?,?,?,?,?)";
				preparedStatement = conn.prepareStatement(add_student);
	
				preparedStatement.setInt(1,userid);
				preparedStatement.setString(2,getName());
				preparedStatement.setString(3, getDob());
				preparedStatement.setString(4,getEmail());
				preparedStatement.setString(5,getPhno());
				preparedStatement.setString(6,getLastdegree());
				preparedStatement.setString(7,getRollno());
				preparedStatement.setInt(8,getCurrentsem());
				preparedStatement.setString(9,getPlace());
				preparedStatement.execute();
				ConnectionPool.freeConnection(conn);
				ServletActionContext.getResponse().addHeader("msg", "Data Has been Inserted Sucessfully");
				return "success";
			}		
			else
			{
				ServletActionContext.getResponse().addHeader("msg", "User Already Exists");
				return "success";
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
			ServletActionContext.getResponse().addHeader("msg", "Error in adding user");
			return "success";
		}
		
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRollno() {
		return rollno;
	}

	public void setRollno(String rollno) {
		this.rollno = rollno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getLastdegree() {
		return lastdegree;
	}

	public void setLastdegree(String lastdegree) {
		this.lastdegree = lastdegree;
	}

	public int getCurrentsem() {
		return currentsem;
	}

	public void setCurrentsem(int currentsem) {
		this.currentsem = currentsem;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

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

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}
}
