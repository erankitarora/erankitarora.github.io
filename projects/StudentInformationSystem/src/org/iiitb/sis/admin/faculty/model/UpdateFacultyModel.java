package org.iiitb.sis.admin.faculty.model;

import java.io.File;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

import org.iiitb.sis.admin.faculty.action.ShowImage;
import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;


public class UpdateFacultyModel  implements ServletRequestAware{

	private int fid;
	private String fname;
	private String fcode;
	private String email;
	private String phno;
	private String doj;
	private File image;
    private String imageContentType;
    private String imageFileName;
    HttpServletRequest servletRequest;
    private String username;
    private String userpwd;
    private int isactive;
      
    public void assign()
	{
		try
		{   System.out.println("this is my fid value i got from update");
			System.out.println(getFid());
			
			Connection con=ConnectionPool.getConnection();
			//ConnectionPool data=new ConnectionPool(); 
			//java.sql.Connection con= data.getConnection();
			String destpath = null;
			String update_faculty;
			String update_user;
			update_faculty= "update faculty set fname=?,doj=?,email=?,phno=?,fcode=? where fid=?";
			if(getImage()==null)
			{
				update_user="update user set uname=?,upwd=?,isactive=? where userid=?";
			}
			else
			{
				update_user="update user set uname=?,upwd=?,isactive=?,userimage=? where userid=?";
			}
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(update_faculty);

			preparedStatement.setString(1,getFname());
			preparedStatement.setString(2,getDoj());
			preparedStatement.setString(3,getEmail());
			preparedStatement.setString(4,getPhno());
			preparedStatement.setString(5,getFcode());
			//System.out.println(getRollno()+getImage());
			preparedStatement.setInt(6,getFid());
			preparedStatement.execute();
			
			preparedStatement = (PreparedStatement) con.prepareStatement(update_user);
			preparedStatement.setString(1,getUsername());
			preparedStatement.setString(2,getUserpwd());
			preparedStatement.setInt(3,getIsactive());
			if(getImage()!=null)
			{
				try
				{
					destpath=this.getClass().getResource("/").getPath();
					//System.out.println("Server path:" + destpath);
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
				preparedStatement.setBinaryStream(4,inputStream,(int)getImage().length());
				preparedStatement.setInt(5,getFid());
			}
			else
			{
				preparedStatement.setInt(4,getFid());
			}
			
			preparedStatement.execute();
			//System.out.println(getUname()+" " + uname +" "+getUpwd()+" "+" "+getIsactive() + " " + getSid());
			ServletActionContext.getResponse().addHeader("msg", "Data Has been Updated Sucessfully");
			ConnectionPool.freeConnection(con);
		}
		catch(Exception e)
		{
			ServletActionContext.getResponse().addHeader("msg", "Update Has been Failed");
			System.out.println(e);
		}
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String uname) {
		this.username = uname;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String upwd) {
		this.userpwd = upwd;
	}

	public int getIsactive() {
		return isactive;
	}

	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getDoj() {
		return doj;
	}

	public void setDoj(String doj) {
		this.doj = doj;
	}

	public String getFcode() {
		return fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
}