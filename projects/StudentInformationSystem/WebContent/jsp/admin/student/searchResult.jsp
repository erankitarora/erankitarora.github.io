<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page import="java.io.OutputStream" %>
<%@include file="./ajaxscripts.jsp" %>

		<div class="panel panel-primary">
		
			<!-- Screen heading -->
			<div class="panel-body" align="center">
				<table class="table">
						<tr>
							<td><b>Select below:</b></td>
							<td><b>Student RollNo.</b></td>
							<td><b>Student Name</b></td>
							<!-- <td><b>Student Picture</b></td> -->
						</tr>
					<c:forEach items="${list}" var="user">
        				<tr>
        					<td><input id="${user.rollno}" class="radio" type="radio" class="btn btn-primary" name="selectedUser" align="left" value="${user.rollno}"></td>
            				<td>${user.rollno}</td>
           					<td>${user.name}</td>
           					<%-- <td><img width="80px" src="showImage?rollno=${user.rollno}"></td> --%>
           				</tr>
           			</c:forEach>
           	         			
           		</table>
           	</div>
           	<div class="col-lg-6" align="center"><input type="button" class="btn btn-primary" onclick="UpdateQuery()" name="input_type" value="Update"></div>
           	<div class="col-lg-6" align="center"><input type="button" class="btn btn-primary" onclick="DeleteQuery()" name="input_type" value="Delete"></div>
		</div>	