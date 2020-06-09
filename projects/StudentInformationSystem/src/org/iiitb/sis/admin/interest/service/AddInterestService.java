package org.iiitb.sis.admin.interest.service;

import org.iiitb.sis.admin.interest.model.AddInterestModel;

public class AddInterestService {
	
	public String add(AddInterestModel result)
	{
		String getMessage=result.assign();
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";			
	}
}
