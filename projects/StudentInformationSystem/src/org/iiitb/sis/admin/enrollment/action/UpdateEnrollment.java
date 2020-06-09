package org.iiitb.sis.admin.enrollment.action;




import org.iiitb.sis.admin.enrollment.model.UpdateEnrollmentModel;
import org.iiitb.sis.admin.enrollment.service.UpdateEnrollmentService;

import com.opensymphony.xwork2.ModelDriven;

public class UpdateEnrollment implements ModelDriven<UpdateEnrollmentModel>{

	private UpdateEnrollmentModel result=new UpdateEnrollmentModel();
	public String execute()
	{
		UpdateEnrollmentService updateService=new UpdateEnrollmentService();
		String getMessage=updateService.update(getResult());
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";
	}
	
	public UpdateEnrollmentModel getResult() {
		return result;
	}

	public void setResult(UpdateEnrollmentModel result) {
		this.result = result;
	}	
	public UpdateEnrollmentModel getModel() {
		return result;
	}
}