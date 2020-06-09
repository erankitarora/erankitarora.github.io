<%! String msg; %>
<div class="panel panel-primary" id="password_panel">
    <div class="panel-heading">
        <h4 align="center">Change Password</h4>
    </div>
  <div class="panel-body" align="center">
	<form class="form-horizontal" name="resetpassword" onsubmit="return resetpwd()">
	  <fieldset>
        <div class="form-group">
            <label for="current_password" class="control-label col-lg-6">Current Password</label>
            <div class="col-lg-4" align="left">
                <input type="password" name="current_password" id="current_password" class="form-control" required autofocus>
            </div>
        </div>
        <div class="form-group">
            <label for="new_password" class="control-label col-lg-6">New Password</label>
            <div class="col-lg-4" align="left">
                <input type="password" name="new_password" id="new_password"  class="form-control" required>
            </div>
        </div>
        <div class="form-group">
            <label for="confirm_password" class="control-label col-lg-6">Confirm Password</label>
            <div class="col-lg-4" align="left">
                <input type="password" name="confirm_password" id="confirm_password" class="form-control" required>
            </div>
        </div>
         <div class="form-group" align="center">
         	<div class="col-lg-4"></div>
         	<div class="col-lg-2">
	        	<input type="button" onclick="loaddescriptionpage()" class="form-control btn-primary"  value="Back">
	        </div>	
	        <div class="col-lg-2">
	        	<button type="submit" class=" form-control btn-success" >Submit</button>
	        </div>
	        <div class="col-lg-4"></div>
	 	</div>
	 	<% msg=response.getHeader("msg");
           if(msg!=null)
           {%>
	 			<div class="col-lg-12 form-group" >
	 				<h4 align="center" class="label label-danger"><%=msg %></h4>
	 			</div>
	 	<%}
	 	%>
	 </fieldset>
    </form>
  </div>
</div>