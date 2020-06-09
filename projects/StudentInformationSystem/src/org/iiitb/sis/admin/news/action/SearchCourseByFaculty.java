package org.iiitb.sis.admin.news.action;

import org.iiitb.sis.admin.news.model.SearchCourseByFacultyModel;
import org.iiitb.sis.admin.news.service.SearchCourseByFacultyService;

import com.opensymphony.xwork2.ModelDriven;

public class SearchCourseByFaculty implements ModelDriven<SearchCourseByFacultyModel>{
	SearchCourseByFacultyModel searchCourseByFacultyModel=new SearchCourseByFacultyModel();

	
	
	private String fid;
	private int cid;
	
	
	public String execute()
	{
		searchCourseByFacultyModel.setFid(fid);
		SearchCourseByFacultyService searchCourseByFacultyService=new SearchCourseByFacultyService();
		String getMessage=searchCourseByFacultyService.search(getSearchCourseByFacultyModel());
		
		if(getMessage.equals("Success"))
		{
			System.out.println(getMessage);
			return "Success";
		}
		else
			return "Failure";
	}
	
	
	public SearchCourseByFacultyModel getSearchCourseByFacultyModel() {
		return searchCourseByFacultyModel;
	}


	public void setSearchCourseByFacultyModel(
			SearchCourseByFacultyModel searchCourseByFacultyModel) {
		this.searchCourseByFacultyModel = searchCourseByFacultyModel;
	}


	@Override
	public SearchCourseByFacultyModel getModel() {
		// TODO Auto-generated method stub
		return null;
	}


	/**
	 * @return the fid
	 */
	public String getFid() {
		return fid;
	}


	/**
	 * @param fid the fid to set
	 */
	public void setFid(String fid) {
		this.fid = fid;
	}


	/**
	 * @return the cid
	 */
	public int getCid() {
		return cid;
	}


	/**
	 * @param cid the cid to set
	 */
	public void setCid(int cid) {
		this.cid = cid;
	}
	

}
