package org.iiitb.sis.admin.course.model;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.iiitb.sis.dto.courses;
import org.iiitb.sis.util.ConnectionPool;



public class updateCourse  {
	
	  
	public ArrayList<courses> object=new ArrayList<courses>();
	
	public String updateEntry(courses sa) throws SQLException
		{
			
		ConnectionPool data=new ConnectionPool();
		java.sql.Connection con= data.getConnection();
		    PreparedStatement st=con.prepareStatement("update courses SET cid=?,ccode=?,cname=?,credits=?,csyllabus=?,semid=?,isactive=? where cid=?"); 
		   
		    st.setInt(1, sa.getCourseId());
		    st.setString(2, sa.getCcode());
		    st.setString(3,sa.getCourseName());
		    st.setInt(4, sa.getCourseCredits());
		    st.setString(5,sa.getCourseSyllabus());
		    st.setString(6,sa.getSemname());
		    st.setInt(7, sa.getIsactive());
		    st.setInt(8,sa.getCourseId());
		    
		    st.execute();
		    

			
		    ConnectionPool.freeConnection(con);
		    
		    
		    return "success";
	    }

	
}
	 


