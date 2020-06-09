package org.iiitb.sis.admin.interest.action;

import org.iiitb.sis.admin.interest.model.DeleteInterestModel;
import org.iiitb.sis.admin.interest.service.DeleteInterestService;

import com.opensymphony.xwork2.ModelDriven;

public class DeleteInterest implements ModelDriven<DeleteInterestModel>{

	private DeleteInterestModel result=new DeleteInterestModel();
	public String execute()
	{
		DeleteInterestService deleteService=new DeleteInterestService();
		String message=deleteService.delete(getResult());
		if(message.equals("success"))
			return "success";
		else
			return "error_user";
	}
	
	public DeleteInterestModel getResult() {
		return result;
	}

	public void setResult(DeleteInterestModel result) {
		this.result = result;
	}	
	public DeleteInterestModel getModel() {
		return result;
	}
}