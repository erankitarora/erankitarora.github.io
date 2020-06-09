package org.iiitb.sis.admin.news.action;

import org.iiitb.sis.admin.news.model.AddNewsModel;
import org.iiitb.sis.admin.news.service.AddNewsService;

import com.opensymphony.xwork2.ModelDriven;

public class AddNews implements ModelDriven<AddNewsModel> {

	AddNewsModel addNewsModel = new AddNewsModel();
	
	public AddNewsModel getAddNewsModel() {
		return addNewsModel;
	}

	public void setAddNewsModel(AddNewsModel addNewsModel) {
		this.addNewsModel = addNewsModel;
	}

	public String execute() {
		AddNewsService addNewsService = new AddNewsService();
		String getMessage = addNewsService.add(getAddNewsModel());
		return getMessage;
	}

	@Override
	public AddNewsModel getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @return the fid
	 */

}
