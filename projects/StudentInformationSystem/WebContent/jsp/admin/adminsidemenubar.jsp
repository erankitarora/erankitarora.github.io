 <div class="container-fluid">
   <div class="row">
     <div class="col-md-2 sidebar">
	   <ul class="nav nav-sidebar">
         <li class="active"><a href="#">SIS Overview <span class="sr-only">(current)</span></a></li>
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Student<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a onclick="loadaddStudent()">Add</a></li>
            <li><a onclick="loadupdateStudent()">Update</a></li>
            <li><a onclick="loaddeleteStudent()">Delete</a></li>
          </ul>
      	</li>      	
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Faculty<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a onclick="loadaddFaculty()">Add</a></li>
            <li><a onclick="loadupdateFaculty()">Update/Delete</a></li>
          </ul>
      	</li>      	
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Course<span class="caret"></span></a>
          <ul class="dropdown-menu">
             <li><a onclick="loadaddCourse()">Add</a></li>
            <li><a onclick="loadupdateCourse()">Update</a></li>
            <li><a onclick="loaddeleteCourse()">Delete</a></li>
          </ul>
      	</li>      	
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">News/Announcement<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a onclick="loadaddNews()">Add News</a></li>
            <li><a onclick="loadaddAnnouncement()">Add Announcement</a></li>
            
          </ul>
      	</li>      	
       </ul>
       <ul class="nav nav-sidebar">
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Enrollment<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a onclick="loadaddenrollment()">Add</a></li>
            <!-- <li><a onclick="loadupdateEnrollment()">Update</a></li> -->
            <li><a onclick="loaddeleteEnrollment()">Delete</a></li>
          </ul>
      	</li>      	
        
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Assignment<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a onclick="loadaddAssignment()">Add</a></li>
            <!-- <li><a onclick="loadupdateAssignment()">Update</a></li> --> <!--  Removing update option. Ignore the jsps for update -->
            <li><a onclick="loaddeleteAssignment()">Delete</a></li>
          </ul>
      	</li>  
      	<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Grading<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a onclick="loadaddgrading()">Add/Update</a></li>
            <!-- <li><a href="#">Update</a></li>
            <li><a href="#">Delete</a></li> -->
          </ul>
      	</li>    	
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Interest<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a onclick="loadaddinterest()">Add</a></li>
            <!-- <li><a onclick="loadupdateAssignment()">Update</a></li> --> <!--  Removing update option. Ignore the jsps for update -->
            <li><a onclick="loaddeleteInterest()">Delete</a></li>
          </ul>
      	</li>   	
       <li><a onclick="viewmyprofile()">Profile</a></li>
       <li><a onclick="loadresetpasswordpage()">Reset Password</a></li>   
       
       <!-- question 1 -->
       <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Question1<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a onclick="loadquestion1()">Student with selected interest</a></li>
                   
          </ul>
      	</li>    
       </ul>
  	</div>
  </div>
 </div>