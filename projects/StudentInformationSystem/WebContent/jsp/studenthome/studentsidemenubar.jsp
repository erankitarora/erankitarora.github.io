 <div class="container-fluid">
   <div class="row">
     <div class="col-md-2 sidebar">
	   <ul class="nav nav-sidebar">
         <li class="active"><a onclick="">SIS Overview <span class="sr-only">(current)</span></a></li>
         <li><a onclick="viewmyprofile()">Profile</a></li>
         <li><a onclick="viewmygrades()">Grades</a></li>
         <li><a onclick="searchcourses()">View Courses</a></li>
         <li><a onclick="getregisteredcourses()">Courses Registered</a></li>
         <li><a onclick="searchfriend()">Search</a></li>
         <li><a onclick="myfriends()">My Friends</a></li>
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Interest<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a onclick="loadaddInterest()">Add</a></li>
            <li><a onclick="loadupdateInterest()">Update/Delete</a></li>
          </ul>
      	</li> 
         <li><a onclick="loadresetpasswordpage()">Reset Password</a></li>
         <li><a onclick="myrequests()">Friend requests</a></li>
       </ul>     
  	</div>
  </div>
 </div>
