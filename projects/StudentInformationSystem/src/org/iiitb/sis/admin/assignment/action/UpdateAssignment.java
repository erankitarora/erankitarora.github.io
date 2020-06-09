package org.iiitb.sis.admin.assignment.action;

import org.iiitb.sis.admin.assignment.service.UpdateAssignmentService;
import org.iiitb.sis.admin.assignment.model.UpdateAssignmentModel;

import com.opensymphony.xwork2.ModelDriven;

public class UpdateAssignment implements ModelDriven<UpdateAssignmentModel>{

	private UpdateAssignmentModel result=new UpdateAssignmentModel();
	public String execute()
	{
		UpdateAssignmentService updateService=new UpdateAssignmentService();
		String getMessage=updateService.update(getResult());
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";
	}
	
	public UpdateAssignmentModel getResult() {
		return result;
	}

	public void setResult(UpdateAssignmentModel result) {
		this.result = result;
	}	
	public UpdateAssignmentModel getModel() {
		return result;
	}
}