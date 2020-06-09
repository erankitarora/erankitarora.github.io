 <nav class="navbar navbar-inverse navbar-fixed-top">
   <div class="container-fluid">
     <div class="navbar-header">
     </div>
     <div id="navbar" class="navbar-collapse collapse">
     	<div class="container-fluid">
     		<div class="row-fluid">
     			<div class="col-lg-3" align="left">
     				 <img style="padding-top:5px;" src="./getprofileimage" height="70px" width="70px" />
     			</div>
		        <div class="col-lg-6" >
		        	<font size="+6"><span class="label" style="color:#4169E1"><em>STUDENT INFORMATION SYSTEM</em></span></font>
		        </div>
        <div class="col-lg-3" align="right">
        	<div class="container-fluid">
        		<div class="row-fluid">
    				<label style="padding-top:15px;color:#9d9d9d;">Welcome <%= session.getAttribute("name") %></label>
       				<a href="./logout" style="color:#fff;">Logout</a>
        		</div>
        		<div class="row-fluid">
        			<label style="padding-top:15px;color:#9d9d9d;" >Last Logged in <%= session.getAttribute("lastloggedon") %></label>
        		</div>
        	</div>
        </div>
      	</div>
      </div>
     </div>
   </div>
 </nav>
