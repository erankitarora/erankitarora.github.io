package org.iiitb.sis.studenthome.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SearchCourses  extends ActionSupport implements ModelDriven<ArrayList<Courses>>
{
	private static final long serialVersionUID = -641393131065532545L;
	private ArrayList<Courses> cr=new ArrayList<Courses>();
	
	public ArrayList<Courses> getCr() {
		return cr;
	}
	public void setCr(ArrayList<Courses> cr) {
		this.cr= cr;
	}
	public void setCoursesintoList(Courses c) {
		this.cr.add(c);
	}
	public String getCourses()
	{
		String ccode=ServletActionContext.getRequest().getHeader("coursecode");
		String cname=ServletActionContext.getRequest().getHeader("coursename");
		if(ccode==null)
			ccode="";
		if(cname==null)
			cname="";
		PreparedStatement pstmt;
		Connection con=null;
		int count=0;
		try
		{
			con=ConnectionPool.getConnection();
			pstmt = con.prepareStatement("select ccode,cname from courses where  isactive=1 && ccode like '%"+ccode+"%' && cname like '%"+cname+"%'");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				count++;
				Courses c=new Courses();
				c.setCname(rs.getString(2));
				c.setCcode(rs.getString(1));
				setCoursesintoList(c);
			}
			ServletActionContext.getResponse().addHeader("ccount", Integer.toString(count));
		    ConnectionPool.freeConnection(con);
		    return "success";
		}
		catch(Exception e)
		{
			e.printStackTrace();
		    ConnectionPool.freeConnection(con);
		    return "error";
		}
	}
	@Override
	public ArrayList<Courses> getModel() {
		return cr;
	}
}
