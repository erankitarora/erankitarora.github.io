package org.iiitb.sis.admin.news.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.struts2.ServletActionContext;
import org.iiitb.sis.util.ConnectionPool;
import org.iiitb.sis.util.Constants;

public class AddAnnouncementModel {

	
	private String anntitle,anndetails;

	public String insert() {
		Connection con;
		try {
			System.out.println("i am in announcement");
			System.out.println(getAnndetails());
			System.out.println(getAnntitle());
			con = ConnectionPool.getConnection();
			PreparedStatement ps; 
            
			ps = con.prepareStatement("insert into announcement(ann_title,ann_details,isactive) values(?,?,1)");
			ps.setString(1,anntitle);
			ps.setString(2,anndetails);
			ps.execute();
			System.out.println("announcement has been insterted");
						
			
		} catch (Exception e) {
			System.out.println(e);
		}
		ServletActionContext.getResponse().addHeader("msg",
				"Announcement Has been Inserted Sucessfully");
		return "Success";
	}

	
	
	public String getAnndetails() {
		return anndetails;
	}


	public void setAnndetails(String anndetails) {
		this.anndetails = anndetails;
	}


	public String getAnntitle() {
		return anntitle;
	}


	public void setAnntitle(String anntitle) {
		this.anntitle = anntitle;
	}


	

}
