<%@page import="org.iiitb.sis.util.ConnectionPool"%>
 <%@page import="org.iiitb.sis.util.Constants"%>
 <%@page import="java.sql.*"%>
<%ResultSet resultset =null;%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Admin: Update News</title>
	<link href="../../../css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>	

<body>

	<%
    try{
    	Connection con=ConnectionPool.getConnection();
     	PreparedStatement ps=con.prepareStatement(org.iiitb.sis.util.Constants.DISPLAY_USER);
     	resultset=ps.executeQuery();
       
	%>




<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Update News</h3></div>
			<div class="panel-body" align="center">
					
					<!-- Input form -->
			<form  method="post" name="update" >
					<fieldset>
					
					
						<div class="row">
							<div class="col-md-12" align="center">
								
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6" align="right">
								<b>Select news id</b>
							</div>
							<div class="col-md-4" align="left">
								<center>
  								      <select name="nid" id="nid" class="form-control">
									        <%  while(resultset.next()){ %>
           										 <option><%= resultset.getString(1)%></option>
           									<%} %> 
           									<%	ConnectionPool.freeConnection(con); %>
           									
      									  	
      								  </select>	
								</center>
								<%
								
        							}
        								catch(Exception e)
        									{
									             out.println("wrong entry"+e);
        									}
								%>
							</div>
						</div>
						<br>
						<br>
						<br>
	
						<div class="row" align="center">							
							<div class="col-lg-12" align="center">
								<input type="button" class="btn btn-primary" onclick="updatenewsscript(this.form)" align="left" value="Search" class="form-control">
							</div>
						</div>
					</fieldset>			
				</form>	
					
					
			</div>
		</div>
		<div id="maincenter1"></div>

<div id="maincenter2"></div>

<script src="js/bootstrap.min.js"></script>

</body>
</html>