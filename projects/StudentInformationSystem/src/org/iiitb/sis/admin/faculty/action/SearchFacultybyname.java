package org.iiitb.sis.admin.faculty.action;

import org.iiitb.sis.admin.faculty.model.SearchFacultybynameModel;
import org.iiitb.sis.admin.faculty.service.*;

import com.opensymphony.xwork2.ModelDriven;

public class SearchFacultybyname implements ModelDriven<SearchFacultybynameModel> {

		private SearchFacultybynameModel faculty=new SearchFacultybynameModel();
		public String execute()
		{
			SearchFacultybynameService searchService=new SearchFacultybynameService();
			String input_type=searchService.search(getResult());
			if(input_type.equals("Update"))			
				return "update";
			else
				return "delete";
		}
		
		public SearchFacultybynameModel getResult() {
			return faculty;
		}

		public void setResult(SearchFacultybynameModel faculty) {
			this.faculty = faculty;
		}	
		public SearchFacultybynameModel getModel() {
			return faculty;
		}
	}
