<div class="panel panel-primary" id="profile_panel">
    <div class="panel-heading">
        <h4 align="center">My Profile</h4>
    </div>
  <div class="panel-body" align="center">
  		<form class="form-horizontal">
	  		<div class="form-group">
	  			<label class="control-label col-lg-6" style="text-align:right">Login Name :</label>
	  			<div class="col-lg-6" align="left" ><%= response.getHeader("uname") %> </div>
	  		</div>
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
	  		<%
	  			if(session.getAttribute("usertype").toString().equals("faculty"))
	  			{%>
	  		  		<div class="form-group">
			  			<label class="control-label col-lg-6" style="text-align:right">Date of Joining :</label>
			  			<div class="col-lg-6" align="left" ><%= response.getHeader("doj") %> </div>
			  		</div>		  				
	  			<%}
	  			else if(session.getAttribute("usertype").toString().equals("admin"))
	  			{%>
	  		  		<div class="form-group">
			  			<label class="control-label col-lg-6" style="text-align:right">Date of Joining :</label>
			  			<div class="col-lg-6" align="left" ><%= response.getHeader("doj") %> </div>
			  		</div>		  				
	  				
	  			<%}
	  			else if(session.getAttribute("usertype").toString().equals("student"))
	  			{%>
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
	  				
	  			<%}
 	  		%>
 	  		<div class="col-lg-5"></div>
	         <div class="col-lg-2 form-group" align="center">
		        <input type="button" onclick="loaddescriptionpage()" class="btn-primary form-control" value="Back">
		 	</div>
		 	<div class="col-lg-5"></div>
	 	</form>
 	</div>
 </div>