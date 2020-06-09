package org.iiitb.sis.admin.enrollment.service;



import org.iiitb.sis.admin.assignment.model.SearchAssignmentModel;
import org.iiitb.sis.admin.enrollment.model.SearchEnrollmentModel;

public class SearchEnrollmentService {

	public String update(SearchEnrollmentModel enrollments)
	{
		
		String input_type=enrollments.getResult();
		return input_type;
	}
	public void search(SearchEnrollmentModel enrollments)
	{
		System.out.println("Search1");
		enrollments.getListAll();
	}
}
