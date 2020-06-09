package org.iiitb.sis.admin.assignment.action;

import org.iiitb.sis.admin.assignment.service.AddAssignmentService;
import org.iiitb.sis.admin.assignment.model.AddAssignmentModel;

import com.opensymphony.xwork2.ModelDriven;

public class AddAssignment implements ModelDriven<AddAssignmentModel>{

	private AddAssignmentModel result=new AddAssignmentModel();
	public String execute()
	{
		AddAssignmentService addService=new AddAssignmentService();
		String getMessage=addService.add(getResult());
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";
	}
	
	public AddAssignmentModel getResult() {
		return result;
	}

	public void setResult(AddAssignmentModel result) {
		this.result = result;
	}	
	public AddAssignmentModel getModel() {
		return result;
	}
}
