package org.iiitb.sis.admin.assignment.service;

import org.iiitb.sis.admin.assignment.model.SearchAssignmentModel;

public class SearchAssignmentService {

	public String update(SearchAssignmentModel assignments)
	{
		String input_type=assignments.getResult();
		return input_type;
	}
	public void search(SearchAssignmentModel assignments)
	{
		assignments.getListAll();
	}
}
