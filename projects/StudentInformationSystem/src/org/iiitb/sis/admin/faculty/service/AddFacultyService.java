package org.iiitb.sis.admin.faculty.service;

import org.iiitb.sis.admin.faculty.model.AddFacultyModel;

public class AddFacultyService {
	
	public String add(AddFacultyModel result)
	{
		String getMessage=result.assign();
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";			
	}
}
