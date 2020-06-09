<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
	
		<!-- Container for the entire page -->
		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Update Assignment: Updated Successfully!</h3></div>
			<div class="panel-body" align="center">
					
					<!-- Input form -->
					<form class="form-horizontal" method="post" enctype="multipart/form-data" name="myform" id="myform">
						<fieldset>
						
							<!-- 0th row of form -->
							
							<div class="row">
								<!-- 2nd column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Faculty Name:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="fname" placeholder="Faculty Name" id="fname" readonly="readonly" value="${fname}" required>
								</div>
							</div>
							
							<br>
								<!-- 2nd column of 0th row -->
													
							<div class="row">
								<!-- 1st column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Course Name:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" id="show" align="left">
									<input type="text" class="form-control" name="cname" placeholder="Course Name" readonly="readonly" value="${cname}" id="cname" required>
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
									<input type="button" id="submit" class="btn btn-primary" value="submit" onclick="updateassignmentscript(this.form)">
								</div>
							</div>
							<!-- 5th row ends here -->
							
						</fieldset>			
					</form>
				</div>
			</div>
			

		<script type="text/javascript">
			function validateForm() {
				    
				var cname = document.forms["myform"]["cname"].value;
				var fname = document.forms["myform"]["fname"].value;
				var semname = document.forms["myform"]["semname"].value;
			   
			    if (cname==null || cname==""){
			        alert("Course Name must be filled out"); return false;}
			    else if (fname==null || fname==""){
			        alert("Faculty Name must be filled out"); return false;}
			    else if (semname==null || semname==""){
			    	alert("Semester must be filled out"); return false;}
			    return true;
			    }
		</script>
