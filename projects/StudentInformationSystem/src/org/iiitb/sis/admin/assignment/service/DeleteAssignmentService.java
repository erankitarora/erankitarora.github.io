package org.iiitb.sis.admin.assignment.service;

import org.iiitb.sis.admin.assignment.model.DeleteAssignmentModel;


public class DeleteAssignmentService {

	public String delete(DeleteAssignmentModel assignment)
	{
		String message=assignment.executeDelete();
		return message;
	}	
}
