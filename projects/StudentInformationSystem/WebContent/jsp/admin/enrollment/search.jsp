<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



	<%@include file="./ajaxscripts.jsp" %>
	<!-- Container for the entire page -->
		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Search Courses By Name</h3></div>
			<div class="panel-body" align="center">
				<form  class="form-horizontal" name="search_form" onsubmit="return validateForm()">
					<fieldset>
						<legend>Search</legend>
						<div class="row">
							<div class="col-lg-4"></div>
							<div class="col-lg-4" align="center">
								<input type="text" class="form-control" onkeyup="search()" id="cname" name="cname" placeholder="Course Name" required>
							</div>
							<div class="col-lg-4" align="left">
								<input type="button" class="btn btn-primary" onclick="validateAndSearch()" align="left" value="Search">
							</div>
						</div>
					</fieldset>			
				</form>
				</div>
			</div>	
			<form class="form-horizontal" method="post" enctype="multipart/form-data" name="updateform" id="updateform">
				<div id="enrollmentMaincenter"></div>
			</form>

<script type="text/javascript">

		function validateAndSearch()
		{
			var cname=document.getElementById('cname').value;
			//window.alert(cname);
			
				searchEnrollment(cname);
			
		}
		
		function search()
		{
			
			var cname=document.getElementById('cname').value;
			//alert(cname);
			
				searchEnrollment(cname);
		}

		function UpdateQuery()
		{
			var selectedUser=null;
			var allRadios = document.getElementsByName("selectedUser");
			for (var i=0;i<allRadios.length;i++)
			{
				if(allRadios[i].checked)
				{
					selectedUser = allRadios[i].value;
				}
			}
			if(selectedUser==null)
			{
				alert("Select a Courses Enrollment to update or delete");
			}
			else
				updateEnrollment(selectedUser,"Update");
		}
		function DeleteQuery()
		{
			
				var selectedUser=null;
				var allRadios = document.getElementsByName("selectedUser");
				for (var i=0;i<allRadios.length;i++)
				{
					if(allRadios[i].checked)
					{
			       		selectedUser = allRadios[i].value;
					}
				}
				if(selectedUser==null)
				{
					alert("Select a Course Enrollment to update or delete");
				}
				else
				{
					var confirmDelete = confirm("Are You Sure?");
					if (confirmDelete == true) 
					{
						updateEnrollment(selectedUser,"Delete");
					}
				}
			} 
		
		
	 

</script>
