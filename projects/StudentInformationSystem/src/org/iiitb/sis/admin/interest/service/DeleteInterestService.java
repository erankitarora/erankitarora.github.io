package org.iiitb.sis.admin.interest.service;

import org.iiitb.sis.admin.interest.model.DeleteInterestModel;


public class DeleteInterestService {

	public String delete(DeleteInterestModel interest)
	{
		String message=interest.executeDelete();
		return message;
	}	
}
