package org.iiitb.sis.admin.student.action;

import org.iiitb.sis.admin.student.model.SearchStudentModel;
import org.iiitb.sis.admin.student.service.SearchStudentService;

import com.opensymphony.xwork2.ModelDriven;

public class SearchStudent implements ModelDriven<SearchStudentModel> {

		private SearchStudentModel student=new SearchStudentModel();
		public String execute()
		{
			SearchStudentService searchService=new SearchStudentService();
			String input_type=searchService.update(getResult());
			if(input_type.equals("Update"))			
				return "update";
			else
				return "delete";
		}
		
		public String listStudents()
		{
			SearchStudentService searchService=new SearchStudentService();
			searchService.search(getResult());
			return "list";
		}
		
		public SearchStudentModel getResult() {
			return student;
		}

		public void setResult(SearchStudentModel student) {
			this.student = student;
		}	
		public SearchStudentModel getModel() {
			return student;
		}
	}
