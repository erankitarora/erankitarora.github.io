package org.iiitb.sis.admin.enrollment.service;

import org.iiitb.sis.admin.enrollment.model.AddEnrollmentModel;

public class AddEnrollmentService {
	
	public String add(AddEnrollmentModel result)
	{
		String getMessage=result.assign();
		return getMessage;			
	}
}
