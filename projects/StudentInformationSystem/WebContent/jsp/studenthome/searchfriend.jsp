<div class="panel panel-primary" id="searchfriend_panel">
    <div class="panel-heading">
        <h4 align="center">Search Friend</h4>
       <form class="form-inline" align="center" name="searchfriendform">
		  <!-- <div class="form-group">
		    <label for="exampleInputName2">Name</label>
		    <input type="search" class="form-control" id="friendname" placeholder="Enter People Name" autofocus>
		  </div> -->
		  <div class="form-group">
		    <label for="exampleInputEmail2"> Enter Student ID</label>
		    <input type="search" class="form-control" id="friendrollno" placeholder="Enter People Roll No">
		  </div>
		  <input type="button" onclick="getsearchfriends()" class="btn btn-success" value="Search" data-toggle="modal">
		   <input type="button" onclick="loaddescriptionpage()" class="form-control btn-default" value="Back">
		</form>
    </div>
  <div class="panel-body" align="center">
  		<div id="searchfriendpanelbodytable" ></div>
 	</div>
 </div>