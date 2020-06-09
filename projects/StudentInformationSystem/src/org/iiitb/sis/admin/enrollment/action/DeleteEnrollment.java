package org.iiitb.sis.admin.enrollment.action;



import org.iiitb.sis.admin.assignment.model.DeleteAssignmentModel;
import org.iiitb.sis.admin.assignment.service.DeleteAssignmentService;
import org.iiitb.sis.admin.enrollment.model.DeleteEnrollmentModel;
import org.iiitb.sis.admin.enrollment.service.DeleteEnrollmentService;

import com.opensymphony.xwork2.ModelDriven;

public class DeleteEnrollment implements ModelDriven<DeleteEnrollmentModel>{

	private DeleteEnrollmentModel result=new DeleteEnrollmentModel();
	public String execute()
	{
		DeleteEnrollmentService deleteService=new DeleteEnrollmentService();
		String message=deleteService.delete(getResult());
		if(message.equals("success"))
			return "success";
		else
			return "error_user";
	}
	
	public DeleteEnrollmentModel getResult() {
		return result;
	}

	public void setResult(DeleteEnrollmentModel result) {
		this.result = result;
	}	
	public DeleteEnrollmentModel getModel() {
		return result;
	}
}