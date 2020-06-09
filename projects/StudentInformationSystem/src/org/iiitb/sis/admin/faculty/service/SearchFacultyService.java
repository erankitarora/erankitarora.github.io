package org.iiitb.sis.admin.faculty.service;

import org.iiitb.sis.admin.faculty.model.SearchFacultyModel;;

public class SearchFacultyService {

	public String search(SearchFacultyModel facultys)
	{
		String input_type=facultys.getResult();
		return input_type;
	}	
}
