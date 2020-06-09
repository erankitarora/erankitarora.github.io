<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%! String msg; 
        String image; %>

<%@taglib prefix="s" uri="/struts-tags" %>

		<%msg=response.getHeader("msg");
			if(msg!=null)
			{%>
				<center><%=response.getHeader("msg") %></center>
			<% }
		     %>
	
		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Update Faculty Registration</h3></div>
			
			<div class="panel-body" align="center">
					<!-- Input form -->
				 
						
						<fieldset>
						
							
							
							<!-- 0th row of form -->
														
							<div class="row">								
								<!-- 1st column of 0th row -->
								<div class="col-lg-5" align="right">
									<b>Login User Name:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="username" value="${uname}" placeholder="Login User Name" id="username" required>
								</div>
							
							</div>
							
							<br>
							
							<div class="row">
								<!-- 2nd column of 0th row -->
								<div class="col-lg-5" align="right">
									<b>Login User password:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="password" class="form-control" name="userpwd" value="${upwd}" placeholder="Login User Password" id="userpwd" required>
								</div>
							</div>
							<!-- 0th row ends here -->
							
							<br>
							
							<!-- 1st row of form -->
							<div class="row">
							
								<!-- 1st column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Faculty Name:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" value="${list[length-1].fname}" name="fname" placeholder="Faculty Name" id="fname" required>
									<input type="hidden" class="form-control" value="${list[length-1].fid}" name="fid" placeholder="Faculty Name" id="fid" required>
								</div>
							
							</div>
							
							<br>
							
							<div class="row">
								<!-- 2nd column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Faculty Roll No:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="fcode" value="${list[length-1].fcode}" placeholder="Faculty Roll No" id="fcode" required>
								</div>
								
							</div>
							
							<br>
						
							<!-- 2nd row of form -->
							<div class="row">
								
								<!-- 1st column of 2nd row -->
								<div class="col-lg-5" align="right">
									<b>Faculty Email:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="email" value="${list[length-1].email}" placeholder="Faculty Email" id="email">
								</div>
							
							</div>
							
							<br>
							
							<div class="row">	
								<!-- 2nd column of 2nd row -->
								<div class="col-lg-5" align="right">
									<b>Faculty Phone No:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="phno" value="${list[length-1].phno}" placeholder="Faculty Phone No" id="phno">
								</div>
								
							</div>
							<!-- 2nd ends here -->						
						
							<br>
						
							<!-- 3rd row of form -->
							<div class="row">
							
								<!-- 1st column of 3rd row -->
								<div class="col-lg-5" align="right">
									<b>Date of Joining:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="date" class="form-control" name="doj" value="${list[length-1].doj}" placeholder="YYYY-MM-DD" id="doj">
								</div>
							
							</div>
							
							<br>
							
							<div class="row">	
								<!-- 2nd column of 4th row -->
								<div class="col-lg-5" align="right">
									<b>Faculty Picture:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">								
									<input class="form-control" type="file" accept="image/*" name="image" id="image">
								</div>
								
							</div>
							<!-- 3rd row ends here -->
							
							<br>
						
							<!-- 4th row of form -->
							<s:property value="fcode"/>
							<s:property value="fcode"/>
							<div class="row">
							<div class="col-lg-5" align="right">
									<b>Current Faculty Picture:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<img width="120px" src="showImageFaculty?rollno=${list[length-1].fcode}">
								</div>
									
							</div>
							
							<br>
								
							<div class="row">	
								<div class="col-lg-5" align="right">
									<b>Current Faculty Status:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<s:select name="isactive" value="isactive" list="#{1:'Active',0:'Inactive'}" />
								</div>
								
							</div>
							<!-- 4th row ends here -->
						
							<br>
												
							
							<br>					
							<!-- 6th row of form -->
							
							<div class="row" align="center">
								<div class="col-lg-12">
								<input id="submit" type="button" class="btn btn-primary" value="Submit" onclick="updatefacultyscript(this.form)">
									
								</div>
							</div>
							
							<!-- 6th row ends here -->
							
						</fieldset>			
				
				</div>
			</div>	
	