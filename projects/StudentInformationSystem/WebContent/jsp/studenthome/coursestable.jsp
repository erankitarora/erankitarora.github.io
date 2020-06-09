<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	if(Integer.parseInt(response.getHeader("ccount").toString())!=0)
	{%>
		<div class="col-lg-12">
			<table class="table table-striped table-bordered table-hover table-responsive" style="width:600px">
			<thead >
				<tr>
					<th class="col-lg-1">  # </th>
					<th class="col-lg-6">  Course Code </th>
					<th class="col-lg-5">Course Name</th>
				</tr>
			</thead>
				<c:forEach items="${cr}" var="c">
					<tr>
						<td><input type="radio" name="coursegroup" id="${c.getCcode()}" value="${c.getCcode()}"></td>
						<td> ${c.getCcode()}</td>
						<td>${c.getCname()}</td>
					</tr>
				</c:forEach>
		</table>
		<input type="button" id="view" value="View" class="btn btn-primary" onclick="loadcoursedetail()">
		  	</div>
		  	<div class="col-lg-12">
		  		<label class="contol-label">  </label>
		</div>
		<div class="col-lg-12" id="course">
		</div>
<% }
	else
	{%>
			<b>Sorry No Results were Found!!! Please change the search criteria...</b>
	<%}
%>
