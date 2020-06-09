<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

		<!-- Container for the entire page -->
		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Update Enrollment: Updated Successfully!!</h3></div>
			<div class="panel-body" align="center">
					
					<!-- Input form -->
					 <form class="form-horizontal" method="post" enctype="multipart/form-data" name="myform" id="myform">
						<fieldset>
						
							<!-- 0th row of form -->
							
							<div class="row">
								<!-- 2nd column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Course Name:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="cname" placeholder="Course Name" id="cname" readonly="readonly" value="${cname}" required>
								</div>
							</div>
							
							<br>
								<!-- 2nd column of 0th row -->
													
							<div class="row">
								<!-- 1st column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Student Name:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" id="show" align="left">
									<input type="text" class="form-control" name="sname" placeholder="Student Name" readonly="readonly" value="${sname}" id="sname" required>
								</div>
							</div>
							
							<br>
							<!-- 0th row ends here -->
						
							<!-- 1st row of form -->
							<div class="row">						
								<!-- 1st column of 0th row -->
								<div class="col-lg-5" align="right">
									<b>Semester:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<s:select name="semname" cssClass="form-control" value="semname" list="semesters" id="semname"/>
								</div>
							</div>	
														
							<!-- 5th row of form -->
							<br>
							<br>
							
							<div class="row" align="center">
								<div class="col-lg-12" >
									<input id="submit" type="button" class="btn btn-primary" value="submit" onclick="updateEnrollmentScript(this.form)">
								</div>
							</div>
							<!-- 5th row ends here -->
							
						</fieldset>			
					 </form> 
				</div>
			</div>

		