package org.iiitb.sis.studenthome.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;

public class GetCourseDetails {
	Connection con;
	private String ccode;
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getCourseDetails()
	{
		PreparedStatement pstmt=null;
		try
		{
			con=ConnectionPool.getConnection();
			pstmt=con.prepareStatement(Constants.GET_COURSE_DETAIL);
			pstmt.setString(1,ccode);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				HttpServletResponse res=ServletActionContext.getResponse();
				res.addHeader("cid", Integer.toString(rs.getInt(1)));
				res.addHeader("ccode", ccode);
				res.addHeader("cname", rs.getString(2));
				res.addHeader("credits",  Integer.toString(rs.getInt(3)));
				res.addHeader("csyllabus", rs.getString(4));
			}
			else
			{
				ServletActionContext.getResponse().addHeader("msg", Constants.ERR);
			    ConnectionPool.freeConnection(con);
			    return "error";
			}
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

}
