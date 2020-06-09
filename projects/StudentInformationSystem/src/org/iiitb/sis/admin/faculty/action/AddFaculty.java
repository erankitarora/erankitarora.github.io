package org.iiitb.sis.admin.faculty.action;

import org.iiitb.sis.admin.faculty.service.AddFacultyService;
import org.iiitb.sis.admin.faculty.model.AddFacultyModel;

import com.opensymphony.xwork2.ModelDriven;

public class AddFaculty implements ModelDriven<AddFacultyModel>{

	private AddFacultyModel result=new AddFacultyModel();
	public String execute()
	{
		AddFacultyService addService=new AddFacultyService();
		String getMessage=addService.add(getResult());
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";
	}
	
	public AddFacultyModel getResult() {
		return result;
	}

	public void setResult(AddFacultyModel result) {
		this.result = result;
	}	
	public AddFacultyModel getModel() {
		return result;
	}
}
