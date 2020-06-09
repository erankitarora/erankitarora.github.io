package org.iiitb.sis.admin.enrollment.model;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.sis.dto.Student;
import org.iiitb.sis.util.ConnectionPool;

public class SearchEnrollmentModel {
	
	private String sname;
	private String input_type;
	private String cname;
	private String semname;
	private ArrayList<Assignment> list = new ArrayList<Assignment>();
	private List<String> semesters = new ArrayList<String>();

	public String getResult()
	{
		//System.out.println("fdkjdsgskjgsd");
		ResultSet rs;
		System.out.println(getCname()+"dffdjkfdkj");
		String fid = null,cid = null,semid = null;
		String sid = null;
		try
		{
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			String query = "select cid,sid,sem from enrollment where sid=(select sid from student where sname=?) and cid=(select cid from courses where cname=?)";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			PreparedStatement preparedStatement1;
			PreparedStatement preparedStatement2;
			preparedStatement.setString(1, getSname());
			preparedStatement.setString(2, getCname());
			rs = preparedStatement.executeQuery();
			//System.out.println(cname);			
			if(rs.next())
			{
				System.out.println(rs.getString(1));
				cid=rs.getString(1);
				sid=rs.getString(2);
				semid=rs.getString(3);
			}
			//System.out.println("Test1:"+fname+cname+fid+cid+input_type);
			query="select sname from student where sid=?";
			preparedStatement = conn.prepareStatement(query);
			query="select semname from sem_master where semid=?";
			preparedStatement1 = conn.prepareStatement(query);
			query="select cname from courses where cid=?";
			preparedStatement2 = conn.prepareStatement(query);
		
			preparedStatement.setString(1, sid);
			rs = preparedStatement.executeQuery();
			
			preparedStatement1.setString(1, semid);
			ResultSet rs1 = preparedStatement1.executeQuery();
				
			preparedStatement2.setString(1, cid);
			ResultSet rs2 = preparedStatement2.executeQuery();
			
			Assignment Assign=new Assignment();
			if(rs.next())
			{					
				Assign.setSname(rs.getString(1));
				setSname(rs.getString(1));
			}
			if(rs1.next())
			{
				Assign.setSemname(rs1.getString(1));
				setSemname(rs1.getString(1));
			}
			if(rs2.next())
			{
				System.out.println(rs2.getString(1)+"dfjdbfdb");
				Assign.setCname(rs2.getString(1));
				setCname(rs2.getString(1));
			}
			list.add(Assign);
			System.out.println(Assign.getCname());
			query = "select semname from sem_master";
			preparedStatement = conn.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			while(rs.next())
			{
				//System.out.println("1");
				setSemesters(rs.getString(1));
			}

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
		
		ResultSet rs2;
		ArrayList<String> fid = new ArrayList<String>();
		ArrayList<String> sid = new ArrayList<String>();
		ArrayList<String> cid=new ArrayList<String>();
		ArrayList<String> semid=new ArrayList<String>();
		ArrayList<String> semname=new ArrayList<String>();
		int i=0;	
					
		try
		{
			//System.out.println("Search");
			//Db data = new Db();
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			String query1="select cid from courses where cname LIKE ?";
			String query ;
			PreparedStatement preparedStatement = conn.prepareStatement(query1);
			preparedStatement.setString(1, "%"+getCname()+"%");
			rs = preparedStatement.executeQuery();
			
			PreparedStatement preparedStatement1;
			while(rs.next())
			{
				 query = "select cid,sid,sem from enrollment where cid=?";
				 preparedStatement1 = conn.prepareStatement(query);
					preparedStatement1.setString(1, rs.getString(1));
					ResultSet rs1 = preparedStatement1.executeQuery();
					while(rs1.next())
					{
						//System.out.println(rs1.getString(2));
						//System.out.println(rs1.getString(2));
						cid.add(rs1.getString(1));
						sid.add(rs1.getString(2));
						semname.add(rs1.getString(3));
					}
					//System.out.println("f");
			}
			
			
			
			PreparedStatement preparedStatement2;
						
			query="select cname from courses where cid=?";
			preparedStatement = conn.prepareStatement(query);
			query="select sname from student where sid=?";
			preparedStatement2 = conn.prepareStatement(query);
			i=0;
			while(i!=cid.size())
			{
				Assignment Assign=new Assignment();
				preparedStatement.setString(1, cid.get(i));
				rs = preparedStatement.executeQuery();
				preparedStatement2.setString(1, sid.get(i));
				rs2 = preparedStatement2.executeQuery();
				Assign.setSemname(semname.get(i));
				if(rs.next())
				{	
					
					Assign.setCname(rs.getString(1));
				}
				
				if(rs2.next())
				{
					Assign.setSname(rs2.getString(1));
					//System.out.println(rs2.getString(1));
				}
					list.add(Assign);
				i++;
			}
			
			data.freeConnection(conn);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	

	public String getCname() {
		return cname;
	}

	public void setCname(String name) {
		this.cname=name;
	}

	public String getSemname() {
		return semname;
	}

	public void setSemname(String semname) {
		this.semname = semname;
	}

	public String getInput_type() {
		return input_type;
	}

	public void setInput_type(String input_type) {
		this.input_type = input_type;
	}

	public ArrayList<Assignment> getList() {
		return list;
	}

	public void setList(Assignment assign) {
		list.add(assign);
	}

	public List<String> getSemesters() {
		return semesters;
	}

	public void setSemesters(String semester) {
		semesters.add(semester);
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
}
