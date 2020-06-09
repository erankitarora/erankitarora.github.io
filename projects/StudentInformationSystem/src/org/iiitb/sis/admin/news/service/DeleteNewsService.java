package org.iiitb.sis.admin.news.service;

import org.iiitb.sis.admin.news.model.AddNewsModel;
import org.iiitb.sis.admin.news.model.DeleteNewsModel;

public class DeleteNewsService {

	
	public String delete(DeleteNewsModel result)
	{
		String getMessage = result.delete();
		System.out.println("hello");
		if(getMessage.equals("Success"))
		{
			System.out.println(getMessage);
			return "Success";
		}
		else
			return "Failure";
	}
}
