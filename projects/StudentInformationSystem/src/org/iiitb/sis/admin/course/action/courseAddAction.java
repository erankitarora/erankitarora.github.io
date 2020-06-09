package org.iiitb.sis.admin.course.action;
import java.sql.SQLException;
import org.iiitb.sis.dto.courses;
import com.opensymphony.xwork2.ModelDriven;

import org.iiitb.sis.admin.course.service.courseAddService;



    public class courseAddAction implements ModelDriven<courses> {
	courses course=new courses();
	
	public String execute() throws SQLException 
	{
		
		
		//System.out.println("action");
		courseAddService ob=new courseAddService();
		String result=ob.check(course);
		
		//System.out.println(result);
		return result;
	}
	@Override
	public courses getModel() {
		// TODO Auto-generated method stub
		return course;
	}
	
}