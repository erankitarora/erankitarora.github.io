<%! String msg; %>
<div id="friendspanel" class="panel panel-success">
    <div class="panel-heading">
        <h4 align="center">Friend Profile</h4>
    </div>
	<div class="panel-body" align="center">
		<div class="col-lg-4">
			<img src="./getimage?sid=<%= response.getHeader("sid")%>" width="200" height=200/>
		</div>
		<div class="col-lg-8">
	  		<form class="form-horizontal">
	  			<%-- <div class="form-group">
		  			<label class="control-label col-lg-6" style="text-align:right">ID :</label>
		 			<div class="col-lg-6" align="left" ><%= response.getHeader("sid") %> </div>
		 		</div> --%>
		  		<div class="form-group">
		  			<label class="control-label col-lg-6" style="text-align:right">Name :</label>
		 			<div class="col-lg-6" align="left" ><%= response.getHeader("name") %> </div>
		 		</div>
		 		<div class="form-group">
		 			<label class="control-label col-lg-6" style="text-align:right">Phone No :</label>
		 			<div class="col-lg-6" align="left" ><%= response.getHeader("phno") %> </div>
		 		</div>
		 		<div class="form-group">
		 			<label class="control-label col-lg-6" style="text-align:right">Email :</label>
		 			<div class="col-lg-6" align="left" ><%= response.getHeader("email") %> </div>
		 		</div>
		 		<div class="form-group">
		 			<label class="control-label col-lg-6" style="text-align:right">Date of Birth :</label>
		 			<div class="col-lg-6" align="left" ><%= response.getHeader("dob") %> </div>
		 		</div>		  				
			  		<div class="form-group">
		 			<label class="control-label col-lg-6" style="text-align:right">Last Degree :</label>
		 			<div class="col-lg-6" align="left" ><%= response.getHeader("lastdegree") %> </div>
		 		</div>		  				
			  	<div class="form-group">
		 			<label class="control-label col-lg-6" style="text-align:right">Roll No :</label>
		 			<div class="col-lg-6" align="left" ><%= response.getHeader("rollno") %> </div>
		 		</div>		  			
	 		<div class="form-group">
		 			<div class="col-lg-5" align="center" ><input class="form-control btn-primary" type="button" name="removefriend" value="Remove Friend" onclick="removetomyfriendslist(<%= response.getHeader("sid") %>)"/></div>
		 		</div>	
		 	</form>
		 </div>
	</div>
</div>
