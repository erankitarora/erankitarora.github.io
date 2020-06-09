package org.iiitb.sis.admin.student.action;

import org.iiitb.sis.admin.student.model.DeleteStudentModel;
import org.iiitb.sis.admin.student.service.DeleteStudentService;

import com.opensymphony.xwork2.ModelDriven;

public class DeleteStudent implements ModelDriven<DeleteStudentModel>{

	private DeleteStudentModel result=new DeleteStudentModel();
	public String execute()
	{
		DeleteStudentService deleteService=new DeleteStudentService();
		deleteService.delete(getResult());
		return "success";
	}
	
	public DeleteStudentModel getResult() {
		return result;
	}

	public void setResult(DeleteStudentModel result) {
		this.result = result;
	}	
	public DeleteStudentModel getModel() {
		return result;
	}
}