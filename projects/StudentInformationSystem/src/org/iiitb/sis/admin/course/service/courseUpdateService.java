package org.iiitb.sis.admin.course.service;

import java.sql.SQLException;

import org.iiitb.sis.dto.courses;
import org.iiitb.sis.admin.course.model.*;;


public class courseUpdateService {
	
	public String check(courses ob) throws SQLException 
	{
			
			updateCourse uc=new updateCourse();
			uc.updateEntry(ob);
			return "success";
		
	}
	

}
