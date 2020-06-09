package org.iiitb.sis.admin.student.service;

import org.iiitb.sis.admin.student.model.UpdateStudentModel;

public class UpdateStudentService {

	public String update(UpdateStudentModel result)
	{
		String getMessage=result.assign();
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";
	}
}
