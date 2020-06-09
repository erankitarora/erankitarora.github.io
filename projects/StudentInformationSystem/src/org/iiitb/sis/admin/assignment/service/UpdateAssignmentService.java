package org.iiitb.sis.admin.assignment.service;

import org.iiitb.sis.admin.assignment.model.UpdateAssignmentModel;

public class UpdateAssignmentService {

	public String update(UpdateAssignmentModel result)
	{
		String getMessage=result.assign();
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";
	}
}
