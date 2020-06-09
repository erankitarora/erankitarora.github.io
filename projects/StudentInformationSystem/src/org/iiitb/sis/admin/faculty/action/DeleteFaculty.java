package org.iiitb.sis.admin.faculty.action;

import org.iiitb.sis.admin.faculty.model.DeleteFacultyModel;
import org.iiitb.sis.admin.faculty.service.DeleteFacultyService;

import com.opensymphony.xwork2.ModelDriven;

public class DeleteFaculty implements ModelDriven<DeleteFacultyModel>{

	private DeleteFacultyModel result=new DeleteFacultyModel();
	public String execute()
	{
		DeleteFacultyService deleteService=new DeleteFacultyService();
		deleteService.delete(getResult());
		return "success";
	}
	
	public DeleteFacultyModel getResult() {
		return result;
	}

	public void setResult(DeleteFacultyModel result) {
		this.result = result;
	}	
	public DeleteFacultyModel getModel() {
		return result;
	}
}