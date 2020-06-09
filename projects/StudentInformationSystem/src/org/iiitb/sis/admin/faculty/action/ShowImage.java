package org.iiitb.sis.admin.faculty.action;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.admin.faculty.model.Db;

import com.opensymphony.xwork2.ActionSupport;
import org.iiitb.sis.util.ConnectionPool;

import org.iiitb.sis.util.Constants;

public class ShowImage extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    public static String rollno;
	

	
	public String getRollno() {
		return rollno;
	}


	public void setRollno(String rollno) {
		this.rollno = rollno;
	}


	public String execute() throws Exception {
		System.out.println("roll	 number recived in showing image");
		System.out.println(rollno);
	//	Db data = new Db();    // DB connection method
		//ConnectionPool data=new ConnectionPool(); 
		//java.sql.Connection con= data.getConnection();
		Connection con=ConnectionPool.getConnection();
		PreparedStatement pstmt = (PreparedStatement) con.prepareStatement("select userimage from user where userid=(select fid from faculty where fcode=?)");
	    pstmt.setString(1,rollno);
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
	    return NONE;
	}
}
