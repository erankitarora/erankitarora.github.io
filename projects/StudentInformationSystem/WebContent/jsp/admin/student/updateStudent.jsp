<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!-- Container for the entire page -->
		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Update Student Registration</h3></div>
			<div class="panel-body" align="center">
					<!-- Input form -->
					<form class="form-horizontal" enctype="multipart/form-data"  id="updateform" name="updateform">
						<fieldset>
						
							<div class="row col-lg-12">
								<input type="hidden" name="sid" id="sid" value="${list[length-1].sid}">
								<input type="hidden" name="unameOld" value="${uname}" id="unameOld">
								<input type="hidden" name="rollnoOld" value="${list[length-1].rollno}" id="rollnoOld">
							</div>
							
							<!-- 0th row of form -->
														
							<div class="row">								
								<!-- 1st column of 0th row -->
								<div class="col-lg-5" align="right">
									<b>Login User Name:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="uname" value="${uname}" placeholder="Login User Name" id="uname" required>
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
									<input type="password" class="form-control" name="upwd" value="${upwd}" placeholder="Login User Password" id="upwd" required>
								</div>
							</div>
							<!-- 0th row ends here -->
							
							<br>
							
							<!-- 1st row of form -->
							<div class="row">
							
								<!-- 1st column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Student Name:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" value="${list[length-1].name}" name="name" placeholder="Student Name" id="name" required>
								</div>
							
							</div>
							
							<br>
							
							<div class="row">
								<!-- 2nd column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Student Roll No:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="rollno" value="${list[length-1].rollno}" placeholder="Student Roll No" id="rollno" required>
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
									<input type="text" class="form-control" name="email" value="${list[length-1].email}" placeholder="Student Email" id="email">
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
									<input type="text" class="form-control" name="phno" value="${list[length-1].phno}" placeholder="Student Phone No" id="phno">
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
									<input type="date" class="form-control" name="dob" value="${list[length-1].dob}" placeholder="YYYY-MM-DD" id="dob">
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
									<input type="text" class="form-control" name="lastdegree" value="${list[length-1].lastdegree}" placeholder="Last Degree" id="lastdegree">
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
								<%-- <div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="currentsem" value="${list[length-1].currentsem}" placeholder="Current semester" id="currentsem">
								</div> --%>
								<div class="col-lg-4" align="left">
									<s:select name="currentsem" cssClass="form-control" value="currentsem" list="semesters" id="currentsem"/>
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
												
							<!-- 5th row of form -->
							
							<div class="row" align="right">
								
								<div class="col-lg-5" align="right">
									<b>Current Student Picture:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<img width="120px" src="showImage?rollno=${list[length-1].rollno}">
								</div>
							
							</div>
							
							<br>
							
							<div class="row">	
								<div class="col-lg-5" align="right">
									<b>Current Student Status:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<s:select name="isactive" cssClass="form-control" value="isactive" list="#{1:'Active',0:'Inactive'}" />
								</div>
								
							</div>
							
							<div class="row">	
								<!-- 2nd column of 3rd row -->
								<div class="col-lg-5" align="right">
									<b>Place of birth:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="place" value="${list[length-1].place}" placeholder="Student BirthPlace" id="place">
								</div>
								
							</div>
							
							<!-- 5th row ends here -->
							
							<br>
							<br>					
							<!-- 6th row of form -->
							
							<div class="row" align="center">
								<div class="col-lg-12">
									<input id="submit" type="button" class="btn btn-primary" value="Submit" onclick="updatestudentscript(this.form)">									
								</div>
							</div>
							
							<!-- 6th row ends here -->
							
						</fieldset>			
					</form>
 				</div>
			</div>			