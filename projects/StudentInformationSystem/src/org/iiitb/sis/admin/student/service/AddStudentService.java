package org.iiitb.sis.admin.student.service;

import org.iiitb.sis.admin.student.model.AddStudentModel;

public class AddStudentService {
	
	public String add(AddStudentModel result)
	{
		String getMessage=result.assign();
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";			
	}
}
