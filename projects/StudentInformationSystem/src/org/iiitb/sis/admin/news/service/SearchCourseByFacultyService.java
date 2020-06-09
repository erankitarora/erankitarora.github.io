package org.iiitb.sis.admin.news.service;

import org.iiitb.sis.admin.news.model.SearchCourseByFacultyModel;

public class SearchCourseByFacultyService {

	
	public String search(SearchCourseByFacultyModel result)
	{
		String getMesaage = result.getCourseID();
		System.out.println("hello");
		if(getMesaage.equals("Success"))
		{
			System.out.println(getMesaage);
			return "Success";
		}
		else
			return "Failure";
	}
}
