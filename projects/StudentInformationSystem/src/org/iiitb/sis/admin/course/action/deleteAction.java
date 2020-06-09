package org.iiitb.sis.admin.course.action;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.iiitb.sis.admin.course.service.courseUpdateService;
import org.iiitb.sis.dto.courses;
import org.iiitb.sis.util.ConnectionPool;

import com.opensymphony.xwork2.ModelDriven;

public class deleteAction {
				private String ccode;
				public courses course=new courses();
				public String execute() throws SQLException
				{	
		
					ConnectionPool data=new ConnectionPool();
					java.sql.Connection con= data.getConnection();
					PreparedStatement st=con.prepareStatement("update courses SET isactive=? where ccode=?"); 
					st.setInt(1, 0);
					st.setString(2,getCcode());
					//System.out.println(sa.getCcode());
					st.execute();
					ConnectionPool.freeConnection(con);   
					return "success2";
							
				}
				
				
				


				public String getCcode() {
					return ccode;
				}


				public void setCcode(String ccode) {
					this.ccode = ccode;
				}



}
