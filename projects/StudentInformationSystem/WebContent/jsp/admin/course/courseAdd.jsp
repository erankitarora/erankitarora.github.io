
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.iiitb.sis.util.ConnectionPool" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@include file="./ajaxscripts.jsp" %>
	
	<%! ConnectionPool data = new ConnectionPool();
		PreparedStatement ps;
		ArrayList<String> semname=new ArrayList<String>();
		int i;
	%>
	<%
		Connection conn = data.getConnection();	
		
		ps=conn.prepareStatement("select semname from sem_master");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			semname.add(rs.getString(1));
		}
		ps.close();
		rs.close();
		data.freeConnection(conn);
	%>




<div class="panel panel-primary" >
	
	<div class="panel-heading"align="center">
		
		<div class="panel-heading" style="font-size: 30px"><b>ADD A NEW COURSE  </b></div><br/>
	</div>

    <br/><br/>
    <form id="myForm" class="form-horizontal"    enctype="multipart/form-data">
  		
  		<div class="row" >
    		<div class="col-lg-4" align="right">	<label  for="ccode"><b>Course Code</b><font color="red">*</font></label></div>
       		 <div class="col-lg-4"> <input  type="text" class="form-control"  name="ccode" placeholder="Enter Course Code" autofocus="autofocus" required></div>
  		</div>
  		<br/>
  		<div class="row">
  			<div class="col-lg-4" align="right"><label  for="courseName"><b>Course Name</b><font color="red">*</font></label></div>
            <div class="col-lg-4" ><input type="text" class="form-control"   name="courseName" placeholder="Enter Course Name" autofocus="autofocus"  required></div>
  		</div>
  		<br/>
  		<div class="row" >
    		<div class="col-lg-4" align="right">	<label  for="credits"><b>Credits</b><font color="red">*</font></label></div>
       		 <div class="col-lg-4"> <input  type="text" class="form-control"   name="courseCredits" placeholder="Enter Credits" autofocus="autofocus" type="number" pattern="[0-9]*" data-error="Please give a numeric value" required="required"></div>
  			
        </div>
        <br>
        <div class="row">
        <div class="col-lg-4" align="right"><label  for="courseName"><b>Select semester</b><font color="red">*</font></label></div>
			<div class="col-lg-4" align="left">
				<select class="form-control" name="semname" placeholder="Semester Name" id="semname" required>
					<%
					for(i=0;i<semname.size();i++)
						{%><option value="<%=semname.get(i) %>"><%=semname.get(i) %></option>
						<%
						}%>
						<%
						semname.clear();  
						%>
				</select>
			</div>
		</div>
        <br/>
  	<div class="row">
		<div class="col-lg-4" align="right">	<label for="syllabus"><b>Syllabus</b><font color="red">*</font></label></div>
        <div class="col-lg-4" ><textarea   class="form-control"  name="courseSyllabus" required></textarea></div>
	</div>	
	<br/>	
	<div class="row">
		<div class="col-lg-4"></div>	
		<div class="col-lg-2">	<input class="home" align="right" type="radio" name="isactive" value='1' required />&nbsp;&nbsp;Active</div>
		<div class="col-lg-2">	<input class="home" type="radio" name="isactive" value='0' required />&nbsp;&nbsp;Inactive<br /></div>
	</div>
		
		<br/><br/>
		<div class="row">
		<div class="col-lg-5"></div>
		<div class="col-lg-2" align="right"> <input type="button" id="submit" value="submit"  class="btn btn-primary" onclick="addcoursescript(this.form)"/></div>
		</div>
</form>
<br>
<div class="row">
	<div class="col-lg-3"></div>
	<div class="col-lg-5">
    	<div class="alert alert-danger alert-error">
    
        <strong>*</strong> All the fields are mandatory
    	</div>
    </div>
</div>

 </div>
