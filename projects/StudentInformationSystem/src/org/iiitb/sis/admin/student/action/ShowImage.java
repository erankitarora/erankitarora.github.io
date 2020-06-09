package org.iiitb.sis.admin.student.action;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;

import com.opensymphony.xwork2.ActionSupport;

public class ShowImage extends ActionSupport{
	
	public static String rollno;

	
	public String execute() throws Exception {
	      Connection conn=ConnectionPool.getConnection();
	    PreparedStatement pstmt = conn.prepareStatement("select userimage from user where userid=(select sid from student where rollno=?)");
	    pstmt.setString(1,rollno);
	    System.out.println(rollno);
	    ResultSet rs = pstmt.executeQuery();
	    if(rs.next()){
	      
	    	HttpServletResponse res=ServletActionContext.getResponse();
	    	res.setContentType("image/jpeg");
	    	InputStream in=rs.getBinaryStream(1);
	    	OutputStream out=res.getOutputStream();
	    	byte[] buffer=new byte[1024];
	    	int len;
	    	while((len=in.read(buffer))!=-1)
	    	{
	    		out.write(buffer,0,len);
	    	}
	    }
	    ConnectionPool.freeConnection(conn);
	    return NONE;
	}
}
