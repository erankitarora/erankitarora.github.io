<div id="coursepanel" class="panel panel-success">
    <div class="panel-heading">
        <h4 align="center">Course Details</h4>
    </div>
	<div class="panel-body" align="center">
		<div class="col-lg-12">
	  		<form class="form-horizontal">
	  			<%-- <div class="form-group">
		  			<label class="control-label col-lg-6" style="text-align:right">ID :</label>
		 			<div class="col-lg-6" align="left" ><%= response.getHeader("cid") %> </div>
		 		</div> --%>
		  		<div class="form-group">
		  			<label class="control-label col-lg-2" style="text-align:right">Course Code :</label>
		 			<div class="col-lg-10" align="left" ><%= response.getHeader("ccode") %> </div>
		 		</div>
		 		<div class="form-group">
		 			<label class="control-label col-lg-2" style="text-align:right">Course Name :</label>
		 			<div class="col-lg-10" align="left" ><%= response.getHeader("cname") %> </div>
		 		</div>
		 		<div class="form-group">
		 			<label class="control-label col-lg-2" style="text-align:right">Credits :</label>
		 			<div class="col-lg-10" align="left" ><%= response.getHeader("credits") %> </div>
		 		</div>
		 		<div class="form-group">
		 			<label class="control-label col-lg-2" style="text-align:right">Syllabus :</label>
		 			<div class="col-lg-10" align="left" ><%= response.getHeader("csyllabus") %> </div>
		 		</div>		  				
		 	</form>
		 </div>
	</div>
</div>
