package org.iiitb.sis.admin.assignment.action;

import org.iiitb.sis.admin.assignment.model.SearchAssignmentModel;
import org.iiitb.sis.admin.assignment.service.SearchAssignmentService;

import com.opensymphony.xwork2.ModelDriven;

public class SearchAssignment implements ModelDriven<SearchAssignmentModel> {

		private SearchAssignmentModel assignment=new SearchAssignmentModel();
		public String execute()
		{
			SearchAssignmentService searchService=new SearchAssignmentService();
			String input_type=searchService.update(getResult());
			if(input_type.equals("Update"))			
				return "update";
			else
				return "delete";
		}
		
		public String listAssignments()
		{
			SearchAssignmentService searchService=new SearchAssignmentService();
			searchService.search(getResult());
			return "list";
		}
		
		public SearchAssignmentModel getResult() {
			return assignment;
		}

		public void setResult(SearchAssignmentModel assignment) {
			this.assignment = assignment;
		}	
		public SearchAssignmentModel getModel() {
			return assignment;
		}
	}
