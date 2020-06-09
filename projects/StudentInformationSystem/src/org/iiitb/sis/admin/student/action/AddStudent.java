package org.iiitb.sis.admin.student.action;

import org.iiitb.sis.admin.student.service.AddStudentService;
import org.iiitb.sis.admin.student.model.AddStudentModel;

import com.opensymphony.xwork2.ModelDriven;

public class AddStudent implements ModelDriven<AddStudentModel>{

	private AddStudentModel result=new AddStudentModel();
	public String execute()
	{
		AddStudentService addService=new AddStudentService();
		String getMessage=addService.add(getResult());
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";
	}
	
	public AddStudentModel getResult() {
		return result;
	}

	public void setResult(AddStudentModel result) {
		this.result = result;
	}	
	public AddStudentModel getModel() {
		return result;
	}
}
