package org.iiitb.sis.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.admin.student.action.ShowImage;
import org.iiitb.sis.dto.Student;
import org.iiitb.sis.util.ConnectionPool;

public class Question1 {
	
	private String interest;
	private int length;
	private ArrayList<Question1Dto> interestStudent= new ArrayList<Question1Dto>();
	
	public String execute()
	{
	
		String student_query = "select rollno,sname,currentsem,sid from student where sid IN(select sid from student_interest where InterestID=(select InterestID from interest_master where InterestName=?))";
		//String user_query = "select * from user where userid IN(select sid from student_interest where InterestID=(select InterestID from interest_master where InterestName=?))";
		ResultSet rs;
		Question1Dto stu_temp = null;
		//input_type="Update";
					
		try
		{
			//Db data = new Db();
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(student_query);
			//PreparedStatement preparedStatement1 = conn.prepareStatement(user_query);
			preparedStatement.setString(1, getInterest());
			//preparedStatement1.setString(1, getInterest());
			rs = preparedStatement.executeQuery();
			//rs1 = preparedStatement.executeQuery();

			int count=0;
			while(rs.next())
			{
				count++;
				stu_temp=new Question1Dto();
				
				stu_temp.setSno(count);
				stu_temp.setRollno(rs.getString(1));
				stu_temp.setName(rs.getString(2));
				stu_temp.setSem(rs.getString(3));
				stu_temp.setSid(rs.getInt(4));
				setInterestStudent(stu_temp);
			}
			setLength(getInterestStudent().size());
			data.freeConnection(conn);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return "success";
	}
	
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public ArrayList<Question1Dto> getInterestStudent() {
		return interestStudent;
	}
	public void setInterestStudent(Question1Dto student) {
		interestStudent.add(student);
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
}
