package org.iiitb.sis.admin.enrollment.service;



import org.iiitb.sis.admin.enrollment.model.UpdateEnrollmentModel;

public class UpdateEnrollmentService {

	public String update(UpdateEnrollmentModel result)
	{
		String getMessage=result.assign();
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";
	}
}
