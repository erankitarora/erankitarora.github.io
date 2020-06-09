package org.iiitb.sis.admin.news.action;

import org.iiitb.sis.admin.news.model.UpdateNewsModel;
import org.iiitb.sis.admin.news.service.UpdateNewsService;

import com.opensymphony.xwork2.ModelDriven;

public class UpdateNews implements ModelDriven<UpdateNewsModel>{
	UpdateNewsModel updateNewsModel=new UpdateNewsModel();
	
	public UpdateNewsModel getUpdateNewsModel() {
		return updateNewsModel;
	}

	public void setUpdateNewsModel(UpdateNewsModel updateNewsModel) {
		this.updateNewsModel = updateNewsModel;
	}

	public String execute()
	{
		UpdateNewsService updateNewsService= new UpdateNewsService();
		String getMessage=updateNewsService.updateService(getUpdateNewsModel());
		return getMessage;
	}

	@Override
	public UpdateNewsModel getModel() {
		// TODO Auto-generated method stub
		return null;
	}
}
