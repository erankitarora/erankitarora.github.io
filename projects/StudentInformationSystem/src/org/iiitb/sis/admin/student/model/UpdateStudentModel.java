package org.iiitb.sis.admin.student.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.iiitb.sis.dto.Student;
import org.iiitb.sis.util.ConnectionPool;


public class UpdateStudentModel  implements ServletRequestAware{

	private int sid;
	private String name;
	private String rollno;
	private String rollnoOld;
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
    private String unameOld;
    private String upwd;
    private int isactive;
    private ArrayList<Student> list = new ArrayList<Student>();
    private int length;
    private List<String> semesters=new ArrayList<String>();
      
    public String assign()
	{
		try
		{
			ConnectionPool data = new ConnectionPool();
			Connection conn = data.getConnection();
			String destpath = null;
			ResultSet rs;
			String query;
			String getUserDetails;
			int count=0;
			String update_student;
			String update_user;
			PreparedStatement preparedStatement;
			Student stu_temp;
			org.iiitb.sis.admin.student.action.ShowImage.rollno=rollno;
			String check_user="select uname from user where uname=? and uname!=?";
			preparedStatement = conn.prepareStatement(check_user);
			preparedStatement.setString(1,getUname());
			preparedStatement.setString(2,getUnameOld());
			rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				count++;
			}
			check_user="select rollno from student where rollno=? and rollno!=?";
			preparedStatement = conn.prepareStatement(check_user);
			preparedStatement.setString(1,getRollno());
			preparedStatement.setString(2,getRollnoOld());
			rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				count++;
			}
			data.freeConnection(conn);
			if(count==0)
			{
				conn=data.getConnection();
			
				update_student= "update student set sname=?,dob=?,email=?,phno=?,lastdegree=?,rollno=?,currentsem=?,BirthPlace007=? where sid=?";
				if(getImage()==null)
				{
					update_user="update user set uname=?,upwd=?,isactive=? where userid=?";
				}
				else
				{
					update_user="update user set uname=?,upwd=?,isactive=?,userimage=? where userid=?";
				}
				//PreparedStatement preparedStatement = (PreparedStatement) data.con.prepareStatement(update_student);
				preparedStatement = conn.prepareStatement(update_student);
	
				preparedStatement.setString(1,getName());
				preparedStatement.setString(2,getDob());
				preparedStatement.setString(3,getEmail());
				preparedStatement.setString(4,getPhno());
				preparedStatement.setString(5,getLastdegree());
				preparedStatement.setString(6,getRollno());
				//System.out.println(getRollno()+getImage());
				preparedStatement.setInt(7,getCurrentsem());
				preparedStatement.setString(8,getPlace());
				preparedStatement.setInt(9,getSid());
				preparedStatement.execute();
				
				preparedStatement = conn.prepareStatement(update_user);
				preparedStatement.setString(1,getUname());
				preparedStatement.setString(2,getUpwd());
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
					preparedStatement.setInt(5,getSid());
				}
				else
				{
					preparedStatement.setInt(4,getSid());
				}
				
				preparedStatement.execute();
				
				
				//transferring data 
				
				query = "select sid,sname,dob,email,phno,lastdegree,currentsem,BirthPlace007 from student where rollno=?";
				preparedStatement = conn.prepareStatement(query);
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
					setList(stu_temp);
				}
						
				setLength(getList().size());
				
				getUserDetails = "select uname,upwd,isactive from user where userid=?";
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
				//System.out.println(getUname()+" " + uname +" "+getUpwd()+" "+" "+getIsactive() + " " + getSid());
				data.freeConnection(conn);
				preparedStatement.close();
				rs.close();
				return "success";
			}
			else
			{
				
				//transferring data 
				conn = data.getConnection();
				query = "select sid,sname,dob,email,phno,lastdegree,currentsem,BirthPlace007 from student where rollno=?";
				preparedStatement = conn.prepareStatement(query);
				preparedStatement.setString(1, getRollnoOld());
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
					stu_temp.setRollno(getRollnoOld());
					stu_temp.setCurrentsem(rs.getInt(7));
					stu_temp.setPlace(rs.getString(8));
					setList(stu_temp);
				}
						
				setLength(getList().size());
				
				getUserDetails = "select uname,upwd,isactive from user where userid=?";
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
				
				preparedStatement.close();
				rs.close();
				data.freeConnection(conn);
				return "error_user";
			}
		}
			catch(Exception e)
			{
				System.out.println(e);
			}
		return "success";
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
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

	public ArrayList<Student> getList() {
		return list;
	}

	public void setList(Student stu_temp) {
		list.add(stu_temp);
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public String getRollnoOld() {
		return rollnoOld;
	}

	public void setRollnoOld(String rollnoOld) {
		this.rollnoOld = rollnoOld;
	}

	public String getUnameOld() {
		return unameOld;
	}

	public void setUnameOld(String unameOld) {
		this.unameOld = unameOld;
	}

	public List<String> getSemesters() {
		return semesters;
	}

	public void setSemesters(String semester) {
		semesters.add(semester);
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}
}