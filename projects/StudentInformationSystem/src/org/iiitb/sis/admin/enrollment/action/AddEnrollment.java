package org.iiitb.sis.admin.enrollment.action;

import org.iiitb.sis.admin.enrollment.service.AddEnrollmentService;
import org.iiitb.sis.admin.enrollment.model.AddEnrollmentModel;

import com.opensymphony.xwork2.ModelDriven;

public class AddEnrollment implements ModelDriven<AddEnrollmentModel>{

	private AddEnrollmentModel result=new AddEnrollmentModel();
	public String execute()
	{
		AddEnrollmentService addService=new AddEnrollmentService();
		String getMessage=addService.add(getResult());
		System.out.println(getMessage);
		return "success";
	}
	
	public AddEnrollmentModel getResult() {
		return result;
	}

	public void setResult(AddEnrollmentModel result) {
		this.result = result;
	}	
	public AddEnrollmentModel getModel() {
		return result;
	}
}
