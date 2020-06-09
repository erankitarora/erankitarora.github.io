<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page import="java.io.OutputStream" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin:Search Result</title>
<link href="../../../css/bootstrap.min.css" rel="stylesheet" media="screen">
<%@include file="./ajaxscripts.jsp" %>
</head>
<body>

	<div class="panel panel-primary">
		<div class="row" id="main-content" align="center">
			<div class="col-lg-3" ></div>
			<div class="col-lg-6" align="center">
				<table class="table" align="center">
						<tr>
							<td><b>Select below:</b></td>
							<td><b>Course Code</b></td>
							<td><b>Course Name</b></td>
							<td><b>Course Credits</b></td>
							<td><b>Semester</b></td>
						</tr>
					<c:forEach items="${object}" var="user">
        				<tr>
        					<td><input id="${user.ccode}" type="radio" class="btn btn-primary" name="selectedCourse" align="left" value="${user.ccode}"></td>
            				<td>${user.ccode}</td>
           					<td>${user.courseName}</td>
           					<td>${user.courseCredits}</td>
           					<td>${user.semid}</td>
           				</tr>
           			</c:forEach>
           	         			
           		</table>
           	</div>
   
         	 	
	</div>
	<div class="row">
	<div class="col-lg-7" ></div>
	<div class="col-lg-5" ><input type="button" class="btn btn-primary" onclick="SearchQuery()" name="input_type" value="View"></div>
		</div> 
	</div>
<script src="js/bootstrap.min.js"></script>
</body>
</html>