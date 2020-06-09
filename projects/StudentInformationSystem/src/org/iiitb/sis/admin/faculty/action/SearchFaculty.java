package org.iiitb.sis.admin.faculty.action;

import org.iiitb.sis.admin.faculty.model.SearchFacultyModel;
import org.iiitb.sis.admin.faculty.service.SearchFacultyService;

import com.opensymphony.xwork2.ModelDriven;

public class SearchFaculty implements ModelDriven<SearchFacultyModel> {

		private SearchFacultyModel faculty=new SearchFacultyModel();
		public String execute()
		{
			SearchFacultyService searchService=new SearchFacultyService();
			String input_type=searchService.search(getResult());
			if(input_type.equals("Update"))			
				return "update";
			else
				return "delete";
		}
		
		public SearchFacultyModel getResult() {
			return faculty;
		}

		public void setResult(SearchFacultyModel faculty) {
			this.faculty = faculty;
		}	
		public SearchFacultyModel getModel() {
			return faculty;
		}
	}
