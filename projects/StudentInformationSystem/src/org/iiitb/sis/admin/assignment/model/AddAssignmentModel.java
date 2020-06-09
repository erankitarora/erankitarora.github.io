package org.iiitb.sis.admin.assignment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;

import com.opensymphony.xwork2.ActionSupport;


public class AddAssignmentModel extends ActionSupport{

	private String fname;
	private String semname;
	
	public String assign()
	{
		try
		{
			//Db data = new Db();
			
			ConnectionPool data = new ConnectionPool();
			Connection conn=data.getConnection();
			PreparedStatement preparedStatement;
			ResultSet rs;
			String fid = null,semid = null,cid_query,fid_query,semid_query,assign_query;
			List<String> cid=new ArrayList<String>();
	
			cid_query = "select cid from courses where cname=?";
			fid_query = "select fid from faculty where fname=?";
			//semid_query = "select semid from sem_master where semname=?";
			//assign_query = "insert into teaches(fid,cid,semid) values(?,?,?)";
			//No need to insert sem into teaches table.
			assign_query = "insert into teaches(fid,cid) values(?,?)";
			int i=0;
			preparedStatement = conn.prepareStatement(cid_query);
			
			while(i!=getCname().length)
			{
				preparedStatement.setString(1,getCname()[i]);
				rs = preparedStatement.executeQuery();
				if(rs.next())
				{
					cid.add(rs.getString(1));
				}
				i++;
			}
			
			preparedStatement = conn.prepareStatement(fid_query);
			preparedStatement.setString(1,getFname());
			rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				fid=rs.getString(1);
			}
			
			/*preparedStatement = conn.prepareStatement(semid_query);
			preparedStatement.setString(1,getSemname());
			rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				semid=rs.getString(1);
			}
			*/
			i=0;
			
			preparedStatement = conn.prepareStatement(assign_query);
			while(i!=cid.size())
			{
				preparedStatement.setString(1,fid);
				preparedStatement.setString(2,cid.get(i));
				//preparedStatement.setString(3,semid);
				preparedStatement.execute();
				i++;
			}
			data.freeConnection(conn);
			ServletActionContext.getResponse().addHeader("msg", "Data Has been Inserted Sucessfully");
			return "success";
		}catch(Exception e)
		{
			System.out.println(e);
			ServletActionContext.getResponse().addHeader("msg", "Error in inserting data");
			return "success";
		}
		
	}

    public String[] getCname() {
    	HttpServletRequest request=ServletActionContext.getRequest();
    	String cname[] = request.getParameterValues("cname");
    	return cname;
	}
    
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getSemname() {
		return semname;
	}

	public void setSemname(String semname) {
		this.semname = semname;
	}

}
