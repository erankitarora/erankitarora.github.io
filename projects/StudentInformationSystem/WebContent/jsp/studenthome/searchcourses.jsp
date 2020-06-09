<div class="panel panel-primary" id="searchcourse_panel">
    <div class="panel-heading">
        <h4 align="center">Search Courses</h4>
       <form class="form-inline" align="center" name="searchfriendform">
		  <div class="form-group">
		    <label for="exampleInputName2">Course Code</label>
		    <input type="search" class="form-control" id="coursecode" placeholder="Enter Course Code" autofocus>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail2">Course Name</label>
		    <input type="search" class="form-control" id="coursename" placeholder="Enter Course Name">
		  </div>
		  <input type="button" onclick="getsearchcourses()" class="btn btn-success" value="Search" data-toggle="modal">
		   <input type="button" onclick="loaddescriptionpage()" class="form-control btn-default" value="Back">
		</form>
    </div>
  <div class="panel-body" align="center">
  		<div id="searchcoursepanelbodytable" ></div>
 	</div>
 </div>