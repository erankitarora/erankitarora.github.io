package org.iiitb.sis.admin.news.service;

import org.iiitb.sis.admin.news.model.AddAnnouncementModel;

public class AddAnnouncementService {

	public String add(AddAnnouncementModel result) {
		String getMesaage = result.insert();
		System.out.println("hello");
		if (getMesaage.equals("Success")) {
			System.out.println(getMesaage);
			return "Success";
		} else
			return "Failure";
	}
}
