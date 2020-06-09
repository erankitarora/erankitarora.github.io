package org.iiitb.sis.admin.news.service;

import org.iiitb.sis.admin.news.model.AddNewsModel;

public class AddNewsService {

	public String add(AddNewsModel result) {
		String getMesaage = result.insert();
		System.out.println("hello");
		if (getMesaage.equals("Success")) {
			System.out.println(getMesaage);
			return "Success";
		} else
			return "Failure";
	}
}
