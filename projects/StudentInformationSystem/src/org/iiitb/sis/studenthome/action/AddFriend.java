
package org.iiitb.sis.studenthome.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;


public class AddFriend {
	Connection con;
	private int friendid;
	public int getFriendid() {
		return friendid;
	}
	public void setFriendid(int ccode) {
		this.friendid = ccode;
	}
	public String addToFriendList()
	{
		int sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
		PreparedStatement pstmt=null;
		try
		{
			con=ConnectionPool.getConnection();
			System.out.println("Hi"+sid+"ok"+friendid);
			pstmt=con.prepareStatement("insert into friends values(?,?,?)");
			pstmt.setInt(1,sid);
			pstmt.setInt(2,friendid);
			pstmt.setInt(3,0);

			int rs=pstmt.executeUpdate();
		    ConnectionPool.freeConnection(con);
		    if(rs!=0)
		    {
		    	ServletActionContext.getResponse().addHeader("msg", "Friend Request has been sent");
			    return "success";		    	
		    }
		    else
		    {
		    	ServletActionContext.getResponse().addHeader("msg", "Error Adding Friend, Contact Admin");
			    return "success";
		    }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		    ConnectionPool.freeConnection(con);
		    ServletActionContext.getResponse().addHeader("msg", "Error Adding Friend, Contact Admin");
		    return "error";
		}
	}
	
	public String removeToFriendList()
	{
		int sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
		PreparedStatement pstmt=null;
		try
		{   
			con=ConnectionPool.getConnection();
			pstmt=con.prepareStatement("delete from friends where (sid=? and sid1=?) or (sid=? and sid1=?)");
			pstmt.setInt(1,friendid);
			pstmt.setInt(2,sid);
			pstmt.setInt(3,sid);
			pstmt.setInt(4,friendid);
			pstmt.execute();
			System.out.println("data has been deleted");
			ConnectionPool.freeConnection(con);
			ServletActionContext.getResponse().addHeader("msg", "Data Has been Deleted"); 
		   return "success";
		    
		}
		catch(Exception e)
		{
			e.printStackTrace();
		    ConnectionPool.freeConnection(con);
		    ServletActionContext.getResponse().addHeader("msg", "Error Adding Friend, Contact Admin");
		    return "error";
		}
	}

}
