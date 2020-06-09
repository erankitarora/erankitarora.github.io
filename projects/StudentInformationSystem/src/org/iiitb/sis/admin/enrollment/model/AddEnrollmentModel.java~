package org.iiitb.sis.admin.enrollment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;

import com.opensymphony.xwork2.ActionSupport;


public class AddEnrollmentModel extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cname;
	private String semname;
	int count=0;
	private List<String> InvalidStudents=new ArrayList<String>();
	String message="success";
	String errormessage="";
	public String assign()
	{
		
		try
		{
			//Db data = new Db();
			
			System.out.println(getCname());
			
			System.out.println(getSemname());
			System.out.println("hello i am in correct place");
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			PreparedStatement preparedStatement,ps2;
			ResultSet rs;
			String cid = null,semid = null,sid_query,check_query,cid_query,semid_query,assign_query;
			List<String> sid=new ArrayList<String>();
			
			sid_query = "select sid from student where sname=?";
			check_query = "Select COUNT(*) from enrollment where sid=?";
			cid_query = "select cid from courses where cname=?";
			semid_query = "select semid from sem_master where semname=?";
			assign_query = "insert into enrollment(cid,sid,gid,sem) values(?,?,5,?)";
			int i=0;
			preparedStatement = conn.prepareStatement(sid_query);
			
			while(i!=getSname().length)
			{			System.out.println("here");

				
				preparedStatement.setString(1,getSname()[i]);
				
				rs = preparedStatement.executeQuery();
				if(rs.next())
				{
					
					
					ps2 = conn.prepareStatement(check_query);
					System.out.println(rs.getString(1));
					ps2.setString(1,rs.getString(1));
					ResultSet rs1 = ps2.executeQuery();
					while(rs1.next())
					{
						count=rs1.getInt(1);
						if(count>3)
						{
							message="error";
							System.out.println(message);
							setInvalidStudents(getSname()[i]);
						}
						else
						{
							System.out.println("nisa");
							sid.add(rs.getString(1));
						}
					}
				}
				i++;
			}
			//System.out.println("here");
			int count1=0;
			for(String li:getInvalidStudents())
			{
				count1++;
				if(count1==1)
				errormessage+=li;
				else
					errormessage+=","+li;	
				
			}
			preparedStatement = conn.prepareStatement(cid_query);
			preparedStatement.setString(1,getCname());
			rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				cid=rs.getString(1);
			}
			
			preparedStatement = conn.prepareStatement(semid_query);
			preparedStatement.setString(1,getSemname());
			rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				semid=rs.getString(1);
			}
			
			i=0;
			
			preparedStatement = conn.prepareStatement(assign_query);
			while(i!=sid.size())
			{
				preparedStatement.setString(1,cid);
				preparedStatement.setString(2,sid.get(i));
				preparedStatement.setString(3,semid);
				preparedStatement.execute();
				i++;
			}
			data.freeConnection(conn);
			if(message.equals("success"))
			{
				ServletActionContext.getResponse().addHeader("msg", "Data Has been Inserted Sucessfully");
			}
			else
			{
				ServletActionContext.getResponse().addHeader("msg", errormessage+" have enrolled in more than 4 courses.");
			}
			return message;
		}catch(Exception e)
		{
			System.out.println(e);
			ServletActionContext.getResponse().addHeader("msg", "Error in inserting data");
			return message;
		}
		
		
	}

    public String[] getSname() {
		//System.out.println("here-->n");
		
    	HttpServletRequest request=ServletActionContext.getRequest();
    	String sname[] = request.getParameterValues("sname");
    	
    	return sname;
	}
    
	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getSemname() {
		return semname;
	}

	public void setSemname(String semname) {
		this.semname = semname;
	}
	public List<String> getInvalidStudents() {
		return InvalidStudents;
	}

	public void setInvalidStudents(String invalid) {
		InvalidStudents.add(invalid);
	}
	

}
