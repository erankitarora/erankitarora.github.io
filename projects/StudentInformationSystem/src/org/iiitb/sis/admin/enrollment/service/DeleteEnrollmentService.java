package org.iiitb.sis.admin.enrollment.service;



import org.iiitb.sis.admin.assignment.model.DeleteAssignmentModel;
import org.iiitb.sis.admin.enrollment.model.DeleteEnrollmentModel;


public class DeleteEnrollmentService {

	public String delete(DeleteEnrollmentModel enrollment)
	{
		String message=enrollment.executeDelete();
		return message;
	}	
}
