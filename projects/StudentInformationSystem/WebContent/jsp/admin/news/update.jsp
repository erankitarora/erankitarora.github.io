<%@page import="org.iiitb.sis.util.ConnectionPool"%>
<%@page import="org.iiitb.sis.util.Constants"%>
<%@page import="java.sql.*"%>
<%
	ResultSet resultset = null;
%>

<%@taglib prefix="s" uri="/struts-tags"%>

<%!String msg;%>
<%
	msg = response.getHeader("msg");
	if (msg != null) {
%>
<div class="col-lg-12 form-group">
	<h2 align="center" class="label label-success"><%=msg%></h2>
</div>
<%
	}
%>
<%
	Connection con = ConnectionPool.getConnection();
	PreparedStatement ps;
	ResultSet rs;
%>


<div class="panel panel-primary">

	<!-- Screen heading -->
	<div class="panel-heading" align="center">
		<h3>Update News</h3>
	</div>
	<div class="panel-body" align="center">

		<!-- Input form -->
		<form id="mishra_form">

			<fieldset>


				<div class="row">


					<div class="col-md-3"></div>
					<div class="col-md-3" align="center">
						<b>Selected news ID</b>
					</div>


					<div class="col-md-1" align="left">
						<input type="text" class="input-block-level"
							name="updateNewsModel.nid" readonly
							value=<s:property value="searchModel.nid"/>>
					</div>
				</div>
				<br>


				<div class="row">


					<div class="col-md-3"></div>
					<div class="col-md-3" align="center">
						<b>Update Course</b>
					</div>

					<div class="col-md-4" align="left">

						<select name="updateNewsModel.cname" id="cid" class="form-control">
							<%
								ps = con.prepareStatement(Constants.GET_COURSE_ID);
								rs = ps.executeQuery();

								while (rs.next()) {
							%>
							<option selected="s:property value="searchModel.cname""><%=rs.getString(3)%></option>
							<%
								}
							%>
						</select>

					</div>

				</div>
				<br>


				<div class="row">


					<div class="col-md-3"></div>
					<div class="col-md-3" align="center">
						<b>Update Faculty</b>
					</div>

					<div class="col-md-4" align="left">

						<select name="updateNewsModel.fname" id="fname"
							class="form-control">
							<%
								ps = con.prepareStatement(Constants.GET_FACULTY_ID);
								rs = ps.executeQuery();

								while (rs.next()) {
							%>
							<option><%=rs.getString(2)%></option>
							<%
								}
								ConnectionPool.freeConnection(con);
							%>
						</select>

					</div>

				</div>
				<br>



				<div class="row">


					<div class="col-md-3"></div>
					<div class="col-md-3" align="center">
						<b>Update News Title</b>
					</div>


					<div class="col-md-3" align="left">
						<input type="text" name="updateNewsModel.ntitle"
							value=<s:property value="searchModel.ntitle"/>>
					</div>
				</div>
				<br>


				<div class="row">


					<div class="col-md-3"></div>
					<div class="col-md-3" align="center">
						<b>Update News details</b>
					</div>


					<div class="col-md-3" align="left">
						<input type="text" name="updateNewsModel.ndetails"
							value=<s:property value="searchModel.ndetails"/>>
					</div>
				</div>
				<br> <br> <br> <br> <br>

				<div class="row" align="center">
					<div class="span12">
						<input type="button" class="btn btn-primary" value="submit" align="center"
							onclick="updatenewsjsp(this.form)">
					</div>
				</div>

			</fieldset>
		</form>

	</div>
</div>


</body>
</html>