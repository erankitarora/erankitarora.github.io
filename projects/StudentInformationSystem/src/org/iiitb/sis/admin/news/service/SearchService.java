package org.iiitb.sis.admin.news.service;

import org.iiitb.sis.admin.news.model.SearchModel;

public class SearchService {
	
	public String search(SearchModel result)
	{
		String getMesaage = result.getInfo();
		System.out.println("hellohh");
		if(getMesaage.equals("Success"))
		{
			System.out.println(getMesaage);
			return "Success";
		}
		else
			return "Failure";
	}

}
