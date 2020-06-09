package org.iiitb.sis.admin.course.model;
import java.sql.*;

import org.iiitb.sis.dto.courses;
import org.iiitb.sis.util.ConnectionPool;



public class connection  {
	

	public String AddEntry(courses sa) throws SQLException
		{
		int semid=1;	
		ConnectionPool data=new ConnectionPool();
		java.sql.Connection con= data.getConnection();
		
		PreparedStatement st=con.prepareStatement("select semid from sem_master where semname=?");
		
		st.setString(1, sa.getSemname());
		ResultSet rs=st.executeQuery();
			while(rs.next())
			{
			 semid=rs.getInt(1);
			}
		    st=con.prepareStatement("insert into courses(ccode,cname,credits,csyllabus,semid,isactive) VALUES (?,?,?,?,?,?)"); 
		    st.setString(1, sa.getCcode());
		    st.setString(2,sa.getCourseName());
		    st.setInt(3, sa.getCourseCredits());
		    st.setString(4,sa.getCourseSyllabus());
		    st.setInt(5, semid);
		    st.setInt(6, sa.getIsactive());
		    st.execute();
		    ConnectionPool.freeConnection(con);
		    return "success";
	    }

	
}
	 


