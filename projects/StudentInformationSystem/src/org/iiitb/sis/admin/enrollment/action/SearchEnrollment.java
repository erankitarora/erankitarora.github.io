package org.iiitb.sis.admin.enrollment.action;







import org.iiitb.sis.admin.enrollment.model.SearchEnrollmentModel;
import org.iiitb.sis.admin.enrollment.service.SearchEnrollmentService;

import com.opensymphony.xwork2.ModelDriven;

public class SearchEnrollment implements ModelDriven<SearchEnrollmentModel> {

		private SearchEnrollmentModel assignment=new SearchEnrollmentModel();
		public String execute()
		{
			SearchEnrollmentService searchService=new SearchEnrollmentService();
			String input_type=searchService.update(getResult());
			if(input_type.equals("Update"))			
				return "update";
			else
				return "delete";
		}
		
		public String listEnrollments()
		{
			System.out.println("Search");
			SearchEnrollmentService searchService=new SearchEnrollmentService();
			searchService.search(getResult());
			return "list";
		}
		
		public SearchEnrollmentModel getResult() {
			return assignment;
		}

		public void setResult(SearchEnrollmentModel assignment) {
			this.assignment = assignment;
		}
		
		public SearchEnrollmentModel getModel() {
			return assignment;
		}
	}
