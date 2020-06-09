<div class="panel panel-primary">
<div class="panel-heading">
	<h3 align="center"><%=response.getHeader("newstitle") %> Details</h3>
</div>
<div class="panel-body">
		<form class="form-horizontal">
			  <fieldset>
			    <div class="form-group">
			      <label class="col-lg-2 control-label">Details</label>
			      <div class="col-lg-10" align="left">
			        <%=response.getHeader("newsdetails") %>
			      </div>
			   <%--  </div>
			    <div class="form-group">
			      <label class="col-lg-2 control-label">Category</label>
			      <div class="col-lg-10" align="left">
			        	<%=response.getHeader("coursename") %>
			      </div>
			    </div>
			    <div class="form-group">
			      <label class="col-lg-2 control-label">Posted By</label>
			      <div class="col-lg-10" align="left">
			      	<%=response.getHeader("facultyname") %>
			      </div> --%>
			    </div>
			     <div class="form-group">
			      <div class="col-lg-10 col-lg-offset-2" align="left">
			        <button type="button" class="btn btn-primary" onclick="loaddescriptionpage()">Back</button>
			      </div>
			    </div>
			  </fieldset>
			</form>
		<p></p>
	</div>
</div>
