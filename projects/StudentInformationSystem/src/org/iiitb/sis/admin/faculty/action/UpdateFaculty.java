package org.iiitb.sis.admin.faculty.action;

import org.iiitb.sis.admin.faculty.service.UpdateFacultyService;
import org.iiitb.sis.admin.faculty.model.UpdateFacultyModel;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateFaculty implements ModelDriven<UpdateFacultyModel>{

	private UpdateFacultyModel result=new UpdateFacultyModel();
	public String execute()
	{
		UpdateFacultyService updateService=new UpdateFacultyService();
		updateService.update(getResult());
		return "success";
	}
	
	public UpdateFacultyModel getResult() {
		return result;
	}

	public void setResult(UpdateFacultyModel result) {
		this.result = result;
	}	
	public UpdateFacultyModel getModel() {
		return result;
	}
}