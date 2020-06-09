package org.iiitb.sis.admin.assignment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.sis.dto.Student;
import org.iiitb.sis.util.ConnectionPool;

public class SearchAssignmentModel {
	
	private String fname;
	private String input_type;
	private String cname;
	private String semname;
	private ArrayList<Assignment> list = new ArrayList<Assignment>();
	private List<String> semesters = new ArrayList<String>();

	public String getResult()
	{
		ResultSet rs;
		String fid = null,cid = null,semid = null;
		
		try
		{
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			String query = "select fid,cid from teaches where fid=(select fid from faculty where fname=?) and cid=(select cid from courses where cname=?)";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			PreparedStatement preparedStatement1;
			PreparedStatement preparedStatement2;
			preparedStatement.setString(1, getFname());
			preparedStatement.setString(2, getCname());
			rs = preparedStatement.executeQuery();
			//System.out.println(cname);			
			if(rs.next())
			{
				fid=rs.getString(1);
				cid=rs.getString(2);
				//semid=rs.getString(3);
			}
			//System.out.println("Test1:"+fname+cname+fid+cid+input_type);
			query="select fname from faculty where fid=?";
			preparedStatement = conn.prepareStatement(query);
			/*query="select semname from sem_master where semid=?";
			preparedStatement1 = conn.prepareStatement(query);*/
			query="select cname from courses where cid=?";
			preparedStatement2 = conn.prepareStatement(query);
		
			preparedStatement.setString(1, fid);
			rs = preparedStatement.executeQuery();
			
	/*		preparedStatement1.setString(1, semid);
			ResultSet rs1 = preparedStatement1.executeQuery();*/
				
			preparedStatement2.setString(1, cid);
			ResultSet rs2 = preparedStatement2.executeQuery();
			
			Assignment Assign=new Assignment();
			if(rs.next())
			{					
				Assign.setFname(rs.getString(1));
				setFname(rs.getString(1));
			}
			/*if(rs1.next())
			{
				Assign.setSemname(rs1.getString(1));
				setSemname(rs1.getString(1));
			}*/
			if(rs2.next())
			{
				Assign.setCname(rs2.getString(1));
				setCname(rs2.getString(1));
			}
			list.add(Assign);
		
			query = "select semname from sem_master";
			preparedStatement = conn.prepareStatement(query);
			rs = preparedStatement.executeQuery();

			while(rs.next())
			{
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
		ResultSet rs1;
		ResultSet rs2;
		ArrayList<String> fid = new ArrayList<String>();
		ArrayList<String> fid_temp = new ArrayList<String>();
		ArrayList<String> cid=new ArrayList<String>();
		ArrayList<String> semid=new ArrayList<String>();
	
		int i=0;	
					
		try
		{
			//Db data = new Db();
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			PreparedStatement preparedStatement;
			String fids="select fid from faculty where fname LIKE ?";
			String fid_teaches="select fid from teaches";
			preparedStatement = conn.prepareStatement(fids);
			preparedStatement.setString(1, "%"+getFname()+"%");
			rs = preparedStatement.executeQuery();
			preparedStatement = conn.prepareStatement(fid_teaches);
			
			int flag=0;
			while(rs.next())
			{
				rs1 = preparedStatement.executeQuery();
				while(rs1.next())
				{
					if(rs.getString(1).equals(rs1.getString(1)))
					flag=1;
				}
				if(flag==1)
				{
					
					fid_temp.add(rs.getString(1));
					flag=0;
				}
				//System.out.println(rs.getString(1) + " " + rs.getString(2));
			}
			
			i=0;
			String query = "select fid,cid from teaches where fid=?";
			preparedStatement = conn.prepareStatement(query);
			PreparedStatement preparedStatement1;
			PreparedStatement preparedStatement2;
			while(i<fid_temp.size())
			{
				preparedStatement.setString(1,fid_temp.get(i));			
				rs = preparedStatement.executeQuery();
				
				while(rs.next())
				{
					fid.add(rs.getString(1));
					cid.add(rs.getString(2));
					//semid.add(rs.getString(3));
				//System.out.println(rs.getString(1) + " " + rs.getString(2));
				}
				i++;
			}
			query="select fname from faculty where fid=?";
			preparedStatement = conn.prepareStatement(query);
			/*query="select semname from sem_master where semid=?";
			preparedStatement1 = conn.prepareStatement(query);*/
			query="select cname from courses where cid=?";
			preparedStatement2 = conn.prepareStatement(query);
			i=0;
			while(i!=fid.size())
			{
				
				preparedStatement.setString(1, fid.get(i));
				rs = preparedStatement.executeQuery();
				/*preparedStatement1.setString(1, semid.get(i));
				rs1 = preparedStatement1.executeQuery();*/
				preparedStatement2.setString(1, cid.get(i));
				rs2 = preparedStatement2.executeQuery();
				Assignment Assign=new Assignment();
				if(rs.next())
				{					
					Assign.setFname(rs.getString(1));
				}
				/*if(rs1.next())
				{
					Assign.setSemname(rs1.getString(1));
				}*/
				if(rs2.next())
				{
					Assign.setCname(rs2.getString(1));
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

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
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
}
