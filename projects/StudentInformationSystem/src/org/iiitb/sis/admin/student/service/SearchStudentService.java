package org.iiitb.sis.admin.student.service;

import org.iiitb.sis.admin.student.model.SearchStudentModel;

public class SearchStudentService {

	public String update(SearchStudentModel students)
	{
		String input_type=students.getResult();
		return input_type;
	}
	public void search(SearchStudentModel students)
	{
		students.getListAll();
	}
}
