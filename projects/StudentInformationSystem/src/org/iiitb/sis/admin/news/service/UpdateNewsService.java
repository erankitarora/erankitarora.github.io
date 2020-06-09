package org.iiitb.sis.admin.news.service;

import org.iiitb.sis.admin.news.model.UpdateNewsModel;

public class UpdateNewsService {
	
	public String updateService(UpdateNewsModel result)
	{
		String getMesaage = result.updateModel();
		if(getMesaage.equals("Success"))
		{
			System.out.println(getMesaage);
			return "Success";
		}
		else
			return "Failure";
	}

}
