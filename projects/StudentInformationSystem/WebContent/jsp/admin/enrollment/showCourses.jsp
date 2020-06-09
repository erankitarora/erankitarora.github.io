<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<select class="form-control" multiple="multiple" name="sname" placeholder="Student Name" id="sname" required>
	<c:forEach items="${sname}" var="name">
        <option value="${name}">${name}</option>
    </c:forEach>
</select>