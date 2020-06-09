package org.iiitb.sis.studenthome.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SearchFriends  extends ActionSupport implements ModelDriven<ArrayList<Friend>>
{
	private static final long serialVersionUID = -4551355238964539368L;
	private ArrayList<Friend> fr=new ArrayList<Friend>();
	
	public ArrayList<Friend> getFr() {
		return fr;
	}
	public void setFr(ArrayList<Friend> fr) {
		this.fr = fr;
	}
	public void setFriendintoList(Friend friend) {
		this.fr.add(friend);
	}
	public String getFriends()
	{
		//String fname=ServletActionContext.getRequest().getHeader("friendname");
		String frollno=ServletActionContext.getRequest().getHeader("friendrollno");
		int sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
		//if(fname==null)
			//fname="";
		if(frollno==null)
			frollno="";
		PreparedStatement pstmt,ps2;
		Connection con=null;
		int count=0;
		try
		{
			String birth=null;
			con=ConnectionPool.getConnection();
			ps2=con.prepareStatement("select BirthPlace007 from student where sid="+sid);
			ResultSet rs1=ps2.executeQuery();
			if(rs1.next())
			{
				birth=rs1.getString(1);
			}
			pstmt = con.prepareStatement("select sname,rollno,sid,currentsem from student where BirthPlace007=? and sid!="+sid+" && (rollno like '%"+frollno+"%') && sid in (select userid from user where  utype='student' && isactive=1) && (sid not in(select sid from friends where sid1="+sid+")  && sid not in(select sid1 from friends where sid="+sid+"))");
			pstmt.setString(1,birth);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				count++;
				Friend f=new Friend();
				f.setSno(count);
				f.setFname(rs.getString(1));
				f.setFrollno(rs.getString(2));
				f.setSid(rs.getInt(3));
				f.setSem(rs.getString(4));
				setFriendintoList(f);
			}
			ServletActionContext.getResponse().addHeader("count", Integer.toString(count));
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
	
	public String getMyFriends()
	{
		String fname=ServletActionContext.getRequest().getHeader("friendname");
		String frollno=ServletActionContext.getRequest().getHeader("friendrollno");
		int sid=Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("userid").toString());
		if(fname==null)
			fname="";
		if(frollno==null)
			frollno="";
		PreparedStatement pstmt;
		Connection con=null;
		int count=0;
		try
		{
			con=ConnectionPool.getConnection();
			pstmt = con.prepareStatement("select sname,rollno,sid from student where  sid!="+sid+" && sid in (select userid from user where  utype='student' && isactive=1) && (sid in(select sid from friends where sid1="+sid+" and status=1)  || sid in(select sid1 from friends where sid="+sid+" and status=1))");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				count++;
				Friend f=new Friend();
				f.setFname(rs.getString(1));
				f.setFrollno(rs.getString(2));
				setFriendintoList(f);
			}
			ServletActionContext.getResponse().addHeader("count", Integer.toString(count));
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
	public ArrayList<Friend> getModel() {
		return fr;
	}
}
