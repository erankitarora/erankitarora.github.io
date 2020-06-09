package org.iiitb.sis.admin.course.action;

import java.sql.SQLException;


import org.iiitb.sis.admin.course.service.courseUpdateService;
import org.iiitb.sis.dto.courses;

import com.opensymphony.xwork2.ModelDriven;

public class courseUpdateAction implements ModelDriven<courses> {
	
	courses course=new courses();
	public String execute() throws SQLException 
	{
		courseUpdateService ob=new courseUpdateService();
		String result=ob.check(course);
		
		return result;
	}
	@Override
	public courses getModel() {
		// TODO Auto-generated method stub
		return course;
	}

}
