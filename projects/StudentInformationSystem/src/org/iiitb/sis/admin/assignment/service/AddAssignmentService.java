package org.iiitb.sis.admin.assignment.service;

import org.iiitb.sis.admin.assignment.model.AddAssignmentModel;

public class AddAssignmentService {
	
	public String add(AddAssignmentModel result)
	{
		String getMessage=result.assign();
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";			
	}
}
