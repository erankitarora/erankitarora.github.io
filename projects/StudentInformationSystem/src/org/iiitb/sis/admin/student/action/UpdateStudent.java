package org.iiitb.sis.admin.student.action;

import org.iiitb.sis.admin.student.service.UpdateStudentService;
import org.iiitb.sis.admin.student.model.UpdateStudentModel;

import com.opensymphony.xwork2.ModelDriven;

public class UpdateStudent implements ModelDriven<UpdateStudentModel>{

	private UpdateStudentModel result=new UpdateStudentModel();
	public String execute()
	{
		UpdateStudentService updateService=new UpdateStudentService();
		String getMessage=updateService.update(getResult());
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";
	}
	
	public UpdateStudentModel getResult() {
		return result;
	}

	public void setResult(UpdateStudentModel result) {
		this.result = result;
	}	
	public UpdateStudentModel getModel() {
		return result;
	}
}