    
		<!-- Container for the entire page -->
		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-heading" align="center"><h3>Faculty Registration</h3></div>
			<div class="panel-body" align="center">
					
					<!-- Input form -->
					<form class="form-horizontal"  method="post" enctype="multipart/form-data" name="myform" id="myform" >
						<fieldset>
						
							<!-- 0th row of form -->
							
							<div class="row">
								<!-- 1st column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Faculty Name:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="name" placeholder="Faculty Name" id="name" required>
								</div>
							</div>
							
							<br>
								<!-- 2nd column of 0th row -->
							<div class="row">
								<!-- 2nd column of 1st row -->
								<div class="col-lg-5" align="right">
									<b>Faculty Roll No:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="rollno" placeholder="Faculty Roll No" id="rollno" required>
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
									<b>Faculty Email:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="text" class="form-control" name="email" placeholder="Faculty Email" id="email">
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
									<input type="text" class="form-control" name="phno" placeholder="Faculty Phone No" id="phno">
								</div>
							</div>			
					
							<!-- 2nd ends here -->						
						
							<br>
						
							<!-- 3rd row of form -->
							
							<div class="row">
								<!-- 1st column of 3rd row -->
								<div class="col-lg-5" align="right">
									<b>Date of Joining</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">
									<input type="date" class="form-control" name="doj" placeholder="YYYY-MM-DD" id="doj">
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
							<!-- 4th row ends here -->
						
							<br>
							
							<div class="row" align="right">
							
								<div class="col-lg-5">
									<b> Faculty Status:</b>
								</div>
								<div class="col-lg-1"></div>
								<div class="col-lg-4" align="left">	
									<select class="form-control" name="isactive">
										<option value=1 selected="selected">Active</option>
										<option value=0>Inactive</option>
									</select>
								</div>
							</div>
														
							<!-- 5th row of form -->
							<br>
							<br>
							
							<div class="row" align="center">
								<div class="col-lg-12" >
									<input type="button" id="submit" class="btn btn-primary" value="submit" onclick="addfacultyscript(this.form)">
									
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

		/*  $("#myform").on('submit',function(e)
		 {
		     alert("i want to insert");
			 var formData = new FormData(this);
		     $.ajax({
		         url:'addFaculty',
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
		     },
		      error: function(jqXHR, textStatus, errorThrown) 
		      {
			    	 document.getElementById("maincenter").innerHTML=jqXHR.responseText;
		      }          
		     });
		     e.preventDefault(); //Prevent Default action. 
		     $(this).unbind(e);
		     $("#myform").submit(); //Submit the form
		 });  */
	</script>
	
		
</body>
</html>
