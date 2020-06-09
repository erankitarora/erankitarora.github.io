package org.iiitb.sis.admin.interest.action;

import org.iiitb.sis.admin.interest.service.*;
import org.iiitb.sis.admin.interest.model.*;


import com.opensymphony.xwork2.ModelDriven;

public class AddInterest implements ModelDriven<AddInterestModel>{

	private AddInterestModel result=new AddInterestModel();
	public String execute()
	{
		AddInterestService addService=new AddInterestService();
		String getMessage=addService.add(getResult());
		if(getMessage.equals("success"))
			return "success";
		else
			return "error_user";
	}
	
	public AddInterestModel getResult() {
		return result;
	}

	public void setResult(AddInterestModel result) {
		this.result = result;
	}	
	public AddInterestModel getModel() {
		return result;
	}
}
