package org.iiitb.sis.studenthome.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;

public class GetFriendProfile 
{
	Connection con;
	private String srollno;
	public String getSrollno() {
		return srollno;
	}
	public void setSrollno(String srollno) {
		this.srollno = srollno;
	}
	public String getFriendProfile()
	{
		PreparedStatement pstmt=null;
		try
		{
			srollno=ServletActionContext.getRequest().getParameter("srollno").toString();
			con=ConnectionPool.getConnection();
			pstmt=con.prepareStatement(Constants.GET_FRIEND_PROFILE);
			pstmt.setString(1,srollno);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				HttpServletResponse res=ServletActionContext.getResponse();
				res.addHeader("name", rs.getString(1));
				res.addHeader("phno", rs.getString(2));
				res.addHeader("email", rs.getString(3));
				res.addHeader("dob", rs.getDate(4).toString());
				res.addHeader("lastdegree", rs.getString(5));
				res.addHeader("rollno", rs.getString(6));
				res.addHeader("sid", Integer.toString(rs.getInt(7)));
				
			}
			else
			{
				ServletActionContext.getResponse().addHeader("msg", Constants.ERR_UNAME);
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
