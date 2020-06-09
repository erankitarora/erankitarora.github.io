package org.iiitb.sis.admin.course.action;
import java.sql.SQLException;

import org.iiitb.sis.admin.course.model.*;
import org.iiitb.sis.admin.course.service.*;

import com.opensymphony.xwork2.ModelDriven;

public class courseSearchAction implements ModelDriven<getCourseDetail>{
	
	getCourseDetail gcd=new getCourseDetail();
	courseDetailService cds;
	courseDetailService ds;
	
	public String execute() throws SQLException
	{
		
		 cds=new courseDetailService();
		 
		 String result=cds.call(gcd);
		
	 return result;
		
	}
	public String getall() throws SQLException 
	{
		
		 cds=new courseDetailService();
		 
		 String result=cds.calllist(gcd);
		
	 return result;
		
	}
	public String deleted()
	{
		
		return "s";
		
	}
	
	public getCourseDetail getModel() {
		// TODO Auto-generated method stub
		return gcd;
	}

	
	

}
