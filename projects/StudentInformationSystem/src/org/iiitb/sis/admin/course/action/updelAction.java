package org.iiitb.sis.admin.course.action;

import java.sql.SQLException;


import org.iiitb.sis.admin.course.service.courseUpdateService;
import org.iiitb.sis.dto.courses;

import com.opensymphony.xwork2.ModelDriven;

public class updelAction implements ModelDriven<courses>{
				public courses course=new courses();
				private String submit;
				public String execute() throws SQLException
				{	
					//System.out.println(getSubmit());
//					if(getSubmit().equals("update"))
					{
						courseUpdateService ob=new courseUpdateService();
						String result=ob.check(course);
						course.get();
						result=result+"1";
						return result;
					}
//					if(getSubmit().equals("delete"))
//					{
//		
//						courseDeleteService ob=new courseDeleteService();
//						String result=ob.check(course);
//						return result+"2";
//					}
					
					
				}
				
				public String getSubmit() {
					return submit;
				}

				public void setSubmit(String submit) {
					this.submit = submit;
				}

				@Override
				public courses getModel() {
					// TODO Auto-generated method stub
					return course;
				}



}
