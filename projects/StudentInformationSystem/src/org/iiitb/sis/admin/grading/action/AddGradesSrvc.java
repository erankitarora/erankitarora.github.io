package org.iiitb.sis.admin.grading.action;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.iiitb.sis.dto.Student;
import org.iiitb.sis.util.ConnectionPool;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
public class AddGradesSrvc extends ActionSupport implements Action{
	private static final long serialVersionUID = 1L;

	private String sql="select student.sid,sname,rollno,cname,gid from courses,enrollment,student where courses.cname="+"(?)"+"and enrollment.sid=student.sid and courses.cid=enrollment.cid";
	Student s1=new Student();
	String result,result1;
 ArrayList<String> list;
	private int count=0;

	//ArrayList of the results of Query
	//i.e Students those who r not register for the course
	
	public void getStudent(AddGradeToNotGraded agt,ArrayList<Student> resultList)
	{	
		Connection con=ConnectionPool.getConnection();
		try
		{	
//			resultList = new ArrayList<Student>();

			java.sql.PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, agt.getCourse_name());
			ResultSet rs=stmt.executeQuery();
			int i=0;
			if(rs.next())
				rs.last();
				System.out.println("row"+rs.getRow());
				agt.Grade=new String[rs.getRow()+1];
				rs.beforeFirst();
				
				
			while(rs.next())
			{			
				s1.setName(rs.getString("sname"));
				s1.setRollno(rs.getString("rollno"));
				s1.setSid(rs.getInt("sid"));
				agt.Grade[i]=Integer.toString(rs.getInt("gid"));
				Student t=new Student(rs.getString("sname"),rs.getString("rollno"),rs.getInt("sid"),1);
				t.setPhno(Integer.toString(rs.getInt("gid")));
				resultList.add(t);
				System.out.println(agt.Grade[i]);
				i++;
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			ConnectionPool.freeConnection(con);
		}
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
	
	public String updatedatabase(String[] Grade,String coursename)
	{
		Connection con=ConnectionPool.getConnection();
		String readsql="select student.sid,cname,gid from courses,enrollment,student where courses.cname="+"(?)"+" and enrollment.sid=student.sid and courses.cid=enrollment.cid";
		String updatesql="update enrollment,courses set enrollment.gid ="+"(?)"+" where courses.cname="+"(?)"+" and enrollment.sid="+"(?)"+"and enrollment.cid = courses.cid";
		try
		{	
//			resultList = new ArrayList<Student>();

			java.sql.PreparedStatement stmt = con.prepareStatement(readsql);
			stmt.setString(1,coursename);
			int i=0;
			ResultSet rs=stmt.executeQuery();
			String[] gradeid={"A","B","C","D","ng"};
			if(rs.next())
				rs.last();
				System.out.println("row"+rs.getRow());
				rs.beforeFirst();
			
			while(rs.next())
			{
				String studentID =rs.getString("sid");
				String GradeID=rs.getString("gid");
				String CourseName = rs.getString("cname");
				System.out.println(Grade[i]+ " "+GradeID);
				if(Grade[i]!=GradeID)
				{
					java.sql.PreparedStatement updtstmt = con.prepareStatement(updatesql);
					updtstmt.setString(1,Grade[i]);
					updtstmt.setString(2,coursename);
					updtstmt.setString(3,studentID);
					int x=updtstmt.executeUpdate();
					System.out.println("success value" + x);
					
				}
				i++;
			}

		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			ConnectionPool.freeConnection(con);
		}
		
		return "Done";
	}
	
	public ArrayList<String> courseList()
	{
		System.out.println("here");
		java.sql.Connection con=ConnectionPool.getConnection();
		String getFromTable="select cname from courses";
		java.sql.PreparedStatement ps;
		list=new ArrayList<String>();
		try
		{
			//list=new ArrayList<String>();
			ps = con.prepareStatement(getFromTable);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString(1));
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		finally
		{
			ConnectionPool.freeConnection(con);
		}
		
		return list;
	}

}
