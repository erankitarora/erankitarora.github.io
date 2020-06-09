package org.iiitb.sis.admin.interest.action;

import org.iiitb.sis.admin.interest.model.SearchInterestModel;
import org.iiitb.sis.admin.interest.service.SearchInterestService;

import com.opensymphony.xwork2.ModelDriven;

public class SearchInterest implements ModelDriven<SearchInterestModel> {

		private SearchInterestModel interest=new SearchInterestModel();
			
		public String listInterests()
		{
			SearchInterestService searchService=new SearchInterestService();
			searchService.search(getResult());
			return "list";
		}
		
		public SearchInterestModel getResult() {
			return interest;
		}

		public void setResult(SearchInterestModel interest) {
			this.interest = interest;
		}	
		public SearchInterestModel getModel() {
			return interest;
		}
	}
