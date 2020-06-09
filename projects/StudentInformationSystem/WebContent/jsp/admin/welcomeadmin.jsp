<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%@include file="/headtag.jsp" %>
	<%@include file="/jsp/ajaxscripts.jsp" %><body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-lg-12"><%@include file="/jsp/profileinfo.jsp" %></div>
		</div>
		<div class="row-fluid">
			<div class="col-lg-2">
				<%@include file="/jsp/admin/adminsidemenubar.jsp" %>
			</div>
			<div class="col-lg-8 main">
				<div id="maincenter"></div>
			</div>
			<div class="col-lg-2">
				<%@include file="/jsp/news.jsp" %>
			</div>	
		</div>
	</div>
</body> 
</html>
