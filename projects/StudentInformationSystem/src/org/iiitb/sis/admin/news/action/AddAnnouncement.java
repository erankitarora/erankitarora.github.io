
package org.iiitb.sis.admin.news.action;

import org.iiitb.sis.admin.news.model.AddAnnouncementModel;
import org.iiitb.sis.admin.news.service.AddAnnouncementService;

import com.opensymphony.xwork2.ModelDriven;

public class AddAnnouncement implements ModelDriven<AddAnnouncementModel> {

	AddAnnouncementModel addAnnouncementModel = new AddAnnouncementModel();
	
	public AddAnnouncementModel getAddAnnouncementModel() {
		return addAnnouncementModel;
	}

	public void setAddAnnouncementModel(AddAnnouncementModel addAnnouncementModel) {
		this.addAnnouncementModel = addAnnouncementModel;
	}

	public String execute() {
		AddAnnouncementService addAnnouncementService = new AddAnnouncementService();
		String getMessage = addAnnouncementService.add(getAddAnnouncementModel());
		return getMessage;
	}

	@Override
	public AddAnnouncementModel getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @return the fid
	 */

}