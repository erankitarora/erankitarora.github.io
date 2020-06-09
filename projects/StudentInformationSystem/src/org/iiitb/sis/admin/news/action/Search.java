package org.iiitb.sis.admin.news.action;

import org.iiitb.sis.admin.news.model.SearchModel;
import org.iiitb.sis.admin.news.service.SearchService;

import com.opensymphony.xwork2.ModelDriven;

public class Search implements ModelDriven<SearchModel>{
	
	private String snid;
	private String nid;
	
	SearchModel searchModel=new SearchModel();
	

	public String execute()
	{
		System.out.println(nid);
		searchModel.setNid(nid);
		SearchService searchService=new SearchService();
		String getMessage=searchService.search(getSearchModel());
		System.out.println(nid);
		
		snid=getNid();
		
		return getMessage;
		
	}
	
	public String getSnid() {
		return snid;
	}
	/**
	 * @param snid the snid to set
	 */
	public void setSnid(String snid) {
		this.snid = snid;
	}

	/**
	 * @return the nid
	 */
	public String getNid() {
		return nid;
	}

	/**
	 * @param nid the nid to set
	 */
	public void setNid(String nid) {
		this.nid = nid;
	}

	public SearchModel getSearchModel() {
		return searchModel;
	}

	public void setSearchModel(SearchModel searchModel) {
		this.searchModel = searchModel;
	}
	
	@Override
	public SearchModel getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
