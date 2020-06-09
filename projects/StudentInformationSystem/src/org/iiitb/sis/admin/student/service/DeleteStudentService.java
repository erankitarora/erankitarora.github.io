package org.iiitb.sis.admin.student.service;

import org.iiitb.sis.admin.student.model.DeleteStudentModel;


public class DeleteStudentService {

	public void delete(DeleteStudentModel students)
	{
		students.executeDelete();
	}	
}
