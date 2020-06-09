<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<!-- Container for the entire page -->
		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Add Interest</h3></div>
			<div class="panel-body" align="center">
					
					<!-- Input form -->
					<form  class="form-horizontal"  method="post" enctype="multipart/form-data" id="myform" name="myform">
						<fieldset>
						
							<!-- 0th row of form -->
							
							<div class="row">
								<!-- 1st column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Interest:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="interest" placeholder="Interest" id="interest" required>
								</div>
							</div>
							
																					
							<!-- 5th row of form -->
							<br>
							<br>
							
							<div class="row" align="center">
								<div class="col-lg-12" >
									<input type="button" class="btn btn-primary" id="interestsubmit" value="Submit"  onclick="addinterestadminvalidate(this.form)">
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
			function addinterestadminvalidate(form)
			{   var uname = document.forms["myform"]["interest"].value;
			    //alert(uname);     
			if (uname==null || uname==""){
		        alert("Interest must be filled out"); return false;}
			     
			     		var xmlhttp;
					if (window.XMLHttpRequest)
					  xmlhttp=new XMLHttpRequest();
					else
					  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
					xmlhttp.onreadystatechange=function()
					  {
					  if (xmlhttp.readyState==4 && xmlhttp.status==200)
						    document.getElementById("maincenter").innerHTML=xmlhttp.responseText;
					  };
					xmlhttp.open("POST","./addInterestadmin",true);
				   var formData = new FormData(form);
					xmlhttp.send(formData);
			}
			</script>