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
		Connection conn = ConnectionPool.getConnection();	
		ps=conn.prepareStatement("select semname from sem_master");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			semname.add(rs.getString(1));
		}
		ps.close();
		rs.close();
		ConnectionPool.freeConnection(conn);
	%>
		
		<!-- Container for the entire page -->
		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Student Registration</h3></div>
			<div class="panel-body" align="center">
					
					<!-- Input form -->
					<form  class="form-horizontal"  method="post" enctype="multipart/form-data" id="myform" name="myform">
						<fieldset>
						
							<!-- 0th row of form -->
							
							<div class="row">
								<!-- 1st column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Student Name:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="name" placeholder="Student Name" id="name" required>
								</div>
							</div>
							
							<br>
								<!-- 2nd column of 0th row -->
							<div class="row">
								<!-- 2nd column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Student Roll No:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="rollno" placeholder="Student Roll No" id="rollno" required>
								</div>
							</div>	
							
							<br>
							<!-- 0th row ends here -->
						
							<!-- 1st row of form -->
							<div class="row">						
								<!-- 1st column of 0th row -->
								<div class="col-lg-5" align="right">
									<b>Login User Name:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="uname" placeholder="Login User Name" id="uname" required>
								</div>
							</div>	
							
							<br>
							
							<div class="row">
													
								<div class="col-lg-5" align="right">
									<b>Login User password:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="password" class="form-control" name="upwd" placeholder="Login User Password" id="upwd" required>
								</div>
							</div>
							
							<!-- 1st row ends here -->
							
							<!-- Line break -->
							<br>
						
							<!-- 2nd row of form -->
							
							<div class="row">	
								<!-- 1st column of 2nd row -->
								<div class="col-lg-5" align="right">
									<b>Student Email:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="email" placeholder="Student Email" id="email">
								</div>
							</div>
							
							<br>
							
							<div class="row">
								<!-- 2nd column of 2nd row -->
								<div class="col-lg-5" align="right">
									<b>Student Phone No:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="phno" placeholder="Student Phone No" id="phno">
								</div>
							</div>			
					
							<!-- 2nd ends here -->						
						
							<br>
						
							<!-- 3rd row of form -->
							
							<div class="row">
								<!-- 1st column of 3rd row -->
								<div class="col-lg-5" align="right">
									<b>Date of Birth:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="date" class="form-control" name="dob" placeholder="YYYY-MM-DD" id="dob">
								</div>
							</div>
							
							<br>
							
							<div class="row">
								<!-- 2nd column of 3rd row -->
								<div class="col-lg-5" align="right">
									<b>Last Degree:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
								<select class="form-control" name="lastdegree" placeholder="Last Degree" id="lastdegree" required>
										<option value="default" selected>Select below</option>
										<option value="Btech(ECE)" selected>Btech(ECE)</option>
										<option value="Btech(CS)" selected>Btech(CS)</option>
									</select>
								
							
								</div>
							</div>
							<!-- 3rd row ends here -->
							
							<br>
						
							<!-- 4th row of form -->
							
							<div class="row">
								<!-- 1st column of 4th row -->
								<div class="col-lg-5" align="right">
									<b>Current Semester:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<select class="form-control" name="currentsem" id="currentsem">
										<%
										for(i=0;i<semname.size();i++)
											{%><option value="<%=semname.get(i) %>"><%=semname.get(i) %></option>
											<%
											}%>
											<%
											semname.clear();  
											%>
									</select>
									<!-- <input type="text" class="form-control" name="currentsem" placeholder="Current semester" id="currentsem" required> -->
								</div>
							</div>
							
							<br>
							
							<div class="row">							
								<!-- 2nd column of 4th row -->
								<div class="col-lg-5" align="right">
									<b>Student Picture:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input class="form-control" type="file" accept="image/*" name="image" id="image">
								</div>
							</div>
							<!-- 4th row ends here -->
						
							<br>
							
							<div class="row" align="right">
							
								<div class="col-lg-5">
									<b> Student Status:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">	
									<select class="dropdown form-control" name="isactive">
										<option value=1 selected="selected">Active</option>
										<option value=0>Inactive</option>
									</select>
								</div>
							</div>
							
							<div class="row">
								<!-- 2nd column of 2nd row -->
								<div class="col-lg-5" align="right">
									<b>Place of birth:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="place" placeholder="Student BirthPlace" id="place">
								</div>
							</div>	
														
							<!-- 5th row of form -->
							<br>
							<br>
							
							<div class="row" align="center">
								<div class="col-lg-12" >
									<input type="button" class="btn btn-primary" id="studentsubmit" value="Submit"  onclick="addstudent(this.form)">
								</div>
							</div>
							<!-- 5th row ends here -->
							<%! String msg; %>
							   <% msg=response.getHeader("msg");
					           if(msg!=null)
					           {%>
						 			<div class="col-lg-12 form-group" >
						 				<h2 align="center" class="label label-success"><%=msg %></h2>
						 			</div>
						 	<%}
						 	%>
							
						</fieldset>			
					</form>
				</div>
			</div>
			
	
	
	


		<script type="text/javascript">
/* 
		 $("#studentsubmit").on('click',function(e)
		 {
			  
			 alert('inside script');
			var uname = document.forms["myform"]["uname"].value;
			var upwd = document.forms["myform"]["upwd"].value;
			var isactive = document.forms["myform"]["isactive"].value;
		    var name = document.forms["myform"]["name"].value;
			var rollno = document.forms["myform"]["rollno"].value;
			var currentsem = document.forms["myform"]["currentsem"].value;				
			   
		    if (name==null || name==""){
		        alert("Student Name must be filled out"); return false;}
		    else if (rollno==null || rollno==""){
		        alert("Student Roll No. must be filled out"); return false;}
		    else if (currentsem==null || currentsem==""){
		    	alert("Student current semester must be filled out"); return false;}
		    else if (uname==null || uname==""){
		        alert("Student Login: User Name must be filled out");return false;}
		    else if (upwd==null || upwd==""){
		        alert("Student Login: Password must be filled out");return false;}
		    else if (isactive==null || isactive==""){
		        alert("Student Status must be filled out");return false;}
			    
		     var formData = new FormData('#myform');
		     $.ajax({
		         url: 'addStudent',
		     type: 'POST',
		         data:  formData,
		     mimeType:"multipart/form-data",
		     contentType: false,
		         cache: false,
		         processData:false,
		     success: function(data, textStatus, jqXHR)
		     {
		  		//alert('added successfully');
		    	 document.getElementById("maincenter").innerHTML=jqXHR.responseText;
		    	 //$("#studentsubmit").bind(e);
		     },
		      error: function(jqXHR, textStatus, errorThrown) 
		      {
			    	 document.getElementById("maincenter").innerHTML=jqXHR.responseText;
		      }          
		     });
		     e.preventDefault();	      
		     $("#studentsubmit").unbind(e);
		    // $("#myform").submit(); //Submit the form
		 }); */
		 
		/*  var formsubmit = document.getElementById('studentsubmit');
		 formsubmit.onclick = function(event) {
			  alert('entered form');
		    event.preventDefault();
		    var request = new XMLHttpRequest();
		    request.open('POST', 'addStudent',false);
		    var formData = new FormData(document.getElementById('myform'));
		    request.send(formData);
		    console.log(request.response);
		    alert('entered form1');
		    document.getElementById("maincenter").innerHTML=request.responseText;
		  }; */
	</script>
	