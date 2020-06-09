<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./ajaxscripts.jsp" %>

	
	<!-- Container for the entire page -->
		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Search Interest By Name</h3></div>
			<div class="panel-body" align="center">
				<form  class="form-horizontal" name="search_form" onsubmit="return validateForm()">
					<fieldset>
						<legend>Search</legend>
						<div class="row">
							<div class="col-lg-4"></div>
							<div class="col-lg-4" align="center">
								<input type="text" class="form-control" onkeyup="search()" id="interest" name="interest" placeholder="Interest" required>
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
				<div id="interestMaincenter"></div>
			</form>

<script type="text/javascript">

		function validateAndSearch()
		{
			var interest=document.getElementById('interest').value;
			/* if(fname) */
				searchInterest(interest);
			/* else
				alert("Please enter the Faculty Name"); */
		}
		
		function search()
		{
			var interest=document.getElementById('interest').value;
			if(interest)
				searchInterest(interest);
		}

	
		function DeleteQuery()
		{
			
				var selectedInterest=null;
				var allRadios = document.getElementsByName("selectedInterest");
				for (var i=0;i<allRadios.length;i++)
				{
					if(allRadios[i].checked)
					{
						selectedInterest = allRadios[i].value;
					}
				}
				if(selectedInterest==null)
				{
					alert("Select Interest to delete");
				}
				else
				{
					var confirmDelete = confirm("Are You Sure?");
					if (confirmDelete == true) 
					{
						deleteInterest(selectedInterest);
					}
				}
			} 

</script>
