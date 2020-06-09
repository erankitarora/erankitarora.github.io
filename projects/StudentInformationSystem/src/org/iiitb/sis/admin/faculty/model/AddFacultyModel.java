package org.iiitb.sis.admin.faculty.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;

public class AddFacultyModel  implements ServletRequestAware{

	private String name;
	private String rollno;
	private String email;
	private String phno;
	private String doj;
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
			Connection con=ConnectionPool.getConnection();
			//ConnectionPool data=new ConnectionPool(); 
			//java.sql.Connection con= data.getConnection();
         	
			String destpath = null;
			PreparedStatement preparedStatement;
			ResultSet rs;
			String add_user;
			int userid = 0;
			int count=0;
			String check_user="select uname from user where uname=?";
		//	PreparedStatement st=con.prepareStatement(
			preparedStatement = (PreparedStatement) con.prepareStatement(check_user);
			preparedStatement.setString(1,getUname());
			rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				count++;
			}
			//data.con.close();
			ConnectionPool.freeConnection(con);
			if(count==0)
			{
				//data = new Db();
				ConnectionPool data1=new ConnectionPool(); 
				java.sql.Connection con1= data1.getConnection();
				if(getImage()!=null)
				{
					add_user = "insert into user(uname,upwd,isactive,utype,userimage) values(?,?,?,?,?)";
				}
				else
				{	
					add_user= "insert into user(uname,upwd,isactive,utype) values(?,?,?,?)";
				}
				preparedStatement = (PreparedStatement) con1.prepareStatement(add_user);
				preparedStatement.setString(1,getUname());
				preparedStatement.setString(2,getUpwd());
				preparedStatement.setInt(3,getIsactive());
				preparedStatement.setString(4,"faculty");
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
				preparedStatement = (PreparedStatement) con1.prepareStatement(get_userid);
				preparedStatement.setString(1,getUname());
				rs = preparedStatement.executeQuery();
				
				if(rs.next())
				{
					userid=rs.getInt(1);
				}
				
				//got the userid
				
				String add_faculty = "insert into faculty(fid,fname,doj,phno,email,fcode) values(?,?,?,?,?,?)";
				preparedStatement = (PreparedStatement) con1.prepareStatement(add_faculty);
	
				preparedStatement.setInt(1,userid);
				preparedStatement.setString(2,getName());
				preparedStatement.setString(3, getDoj());
				preparedStatement.setString(5,getEmail());
				preparedStatement.setString(4,getPhno());
				preparedStatement.setString(6,getRollno());
				preparedStatement.execute();
				//data.con.close();
				ConnectionPool.freeConnection(con1);
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
			ServletActionContext.getResponse().addHeader("msg", "User Already Exists");
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

	public String getDoj() {
		return doj;
	}

	public void setDoj(String doj) {
		this.doj = doj;
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
}
