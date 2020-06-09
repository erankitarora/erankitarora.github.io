package org.iiitb.sis.admin.faculty.service;

import org.iiitb.sis.admin.faculty.model.DeleteFacultyModel;


public class DeleteFacultyService {

	public void delete(DeleteFacultyModel facultys)
	{
		facultys.executeDelete();
	}	
}
