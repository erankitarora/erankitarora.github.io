package org.iiitb.sis.admin.news.action;

import org.iiitb.sis.admin.news.model.DeleteNewsModel;
import org.iiitb.sis.admin.news.service.DeleteNewsService;

import com.opensymphony.xwork2.ModelDriven;

public class DeleteNews implements ModelDriven<DeleteNewsModel> {
	
	DeleteNewsModel deleteNewsModel = new DeleteNewsModel();
	private String newsname;
	
	public DeleteNewsModel getDeleteNewsModel() {
		return deleteNewsModel;
	}
	
	
	public void setDeleteNewsModel(DeleteNewsModel deleteNewsModel) {
		this.deleteNewsModel = deleteNewsModel;
	}
	public String execute()
	{
		deleteNewsModel.setNewsname(newsname);
		DeleteNewsService deleteNewsService =new DeleteNewsService();
		String getMessage =deleteNewsService.delete(getDeleteNewsModel());
		return getMessage;
	}


	@Override
	public DeleteNewsModel getModel() {
		// TODO Auto-generated method stub
		return null;
	}


	
	/**
	 * @return the newsname
	 */
	public String getNewsname() {
		return newsname;
	}


	/**
	 * @param newsname the newsname to set
	 */
	public void setNewsname(String newsname) {
		this.newsname = newsname;
	}
	
	

}
