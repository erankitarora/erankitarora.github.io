
<%@page import="org.iiitb.sis.util.ConnectionPool"%>
<%@page import="org.iiitb.sis.util.Constants"%>
<%@page import="java.sql.*"%>
<%
	ResultSet resultset = null;
%>

<%!String msg;%>
<%
	msg = response.getHeader("msg");
	if (msg != null) {
%>
<div class="col-lg-12 form-group">

	<h3>
		<span class="label label-succes"><%=msg%></span>
	</h3>
</div>
<%
	}
%>

<%
	try {
		Connection con = ConnectionPool.getConnection();
		PreparedStatement ps = con
				.prepareStatement(Constants.DISPLAY_USER);
		resultset = ps.executeQuery();
%>



<div class="panel panel-primary">

	<!-- Screen heading -->
	<div class="panel-heading" align="center">
		<h3>Delete News</h3>
	</div>
	<div class="panel-body" align="center">

		<!-- Input form -->

		<form class="form-horizontal" method="post"
			enctype="multipart/form-data" name="myform" id="myform">
			<fieldset>

				<div class="row">

					<div class="col-md-6" align="right">
						<b>Select News Id</b>
					</div>




					<div class="col-md-6" align="left">
						<select name="newsname" id="nid">
							<%
								while (resultset.next()) {
							%>
							<option><%=resultset.getString(2)%></option>
							<%
								}
							%>
							<%
								ConnectionPool.freeConnection(con);
							%>


						</select>
						<%
							} catch (Exception e) {
								out.println("wrong entry" + e);
							}
						%>


					</div>
				</div>
				<br> <br> <br>

				<div class="row">


					<div class="col-md-12" align="center ">

						<input type="button" class="btn btn-primary"
							onclick="validateAndSearch()" align="left" value="DELETE"
							class="form-control">
					</div>
				</div>
			</fieldset>
		</form>


	</div>
</div>



<script type="text/javascript">
	function validateAndSearch() {
		var nid = document.getElementById('nid').value;
		deleteNews(nid);

	}
</script>
