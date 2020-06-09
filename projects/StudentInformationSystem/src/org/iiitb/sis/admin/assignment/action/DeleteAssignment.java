package org.iiitb.sis.admin.assignment.action;

import org.iiitb.sis.admin.assignment.model.DeleteAssignmentModel;
import org.iiitb.sis.admin.assignment.service.DeleteAssignmentService;

import com.opensymphony.xwork2.ModelDriven;

public class DeleteAssignment implements ModelDriven<DeleteAssignmentModel>{

	private DeleteAssignmentModel result=new DeleteAssignmentModel();
	public String execute()
	{
		DeleteAssignmentService deleteService=new DeleteAssignmentService();
		String message=deleteService.delete(getResult());
		if(message.equals("success"))
			return "success";
		else
			return "error_user";
	}
	
	public DeleteAssignmentModel getResult() {
		return result;
	}

	public void setResult(DeleteAssignmentModel result) {
		this.result = result;
	}	
	public DeleteAssignmentModel getModel() {
		return result;
	}
}