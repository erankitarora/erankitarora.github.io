<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
	<%
		if(Integer.parseInt(response.getHeader("count").toString())!=0)
		{%>
	<div class="col-lg-12">
		<b>List of students from same place:</b>
		<table class="table table-striped table-bordered table-hover table-responsive" style="width:600px">
			<thead >
				<tr>
					<!-- <th class="col-lg-1">  # </th> -->
					<th class="col-lg-5"> Serial Number</th>
					<th class="col-lg-5"> Student ID</th>
					<th class="col-lg-6">  Name </th>
					<th class="col-lg-6">  Sem </th>
					<th class="col-lg-6">  Select: </th>
					
				</tr>
			</thead>
				<c:forEach items="${fr}" var="user">
					<tr>
						<td>${user.getSno()}</td>
						<td>${user.getFrollno()}</td>
						<td> ${user.getFname()}</td>
						<td>${user.getSem()}</td>
						<td><input type="button" name="friendsgroup" id="${user.getSid()}" value="Add Friend" onclick="addtomyfriendslist(this.id)"></td>
					</tr>
				</c:forEach>
		</table>
		<!-- <input type="button" id="view" value="View" class="btn btn-primary" onclick="loadfriendprofile()"> -->
   	</div>
   	<div class="col-lg-12">
   		<label class="contol-label">  </label>
	</div>
	<div class="col-lg-12" id="friend">
	</div>
	<% }
		else
		{%>
				<b>No Friends Found...</b>
		<%}
	%>
