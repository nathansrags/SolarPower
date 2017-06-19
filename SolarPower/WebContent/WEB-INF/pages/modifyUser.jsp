<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/pages/tagLib.jsp"%>
<html>
<head>
<title>Home</title>
<%@ include file="/WEB-INF/pages/common/common.jsp"%>

<script type="text/javascript">
	$(function() {
		$('input').checkBox();
		$('#toggle-all').click(function() {
			$('#toggle-all').toggleClass('toggle-checked');
			$('#ModifyUserForm input[type=checkbox]').checkBox('toggle');
			return false;
		});
	});
</script>

<![if !IE 7]>

<script type="text/javascript">
	$(document).ready(function() {
		$('.styledselect').selectbox({
			inputClass : "selectbox_styled"
		});
	});
</script>


<![endif]>


<script type="text/javascript">
	$(document).ready(function() {
		$('.styledselect_form_1').selectbox({
			inputClass : "styledselect_form_1"
		});
		$('.styledselect_form_2').selectbox({
			inputClass : "styledselect_form_2"
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.styledselect_pages').selectbox({
			inputClass : "styledselect_pages"
		});
	});
</script>

<script type="text/javascript" charset="utf-8">
	$(function() {
		$("input.file_1").filestyle({
			image : "<c:url value='/images/forms/upload_file.gif' />",
			imageheight : 29,
			imagewidth : 78,
			width : 300
		});
	});
</script>

<!-- Custom jquery scripts -->
<script src="<c:url value='/js/jquery/custom_jquery.js' />"
	type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		$('a.info-tooltip ').tooltip({
			track : true,
			delay : 0,
			fixPNG : true,
			showURL : false,
			showBody : " - ",
			top : -35,
			left : 5
		});
	});
</script>

<!--  date picker script -->
<link rel="stylesheet" href="<c:url value='/css/datePicker.css' />"
	type="text/css" />
<script src="<c:url value='/js/jquery/date.js' />"
	type="text/javascript"></script>
<script src="<c:url value='/js/jquery/jquery.datePicker.js' />"
	type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
	$(function() {

		// initialise the "Select date" link
		$('#date-pick').datePicker(
		// associate the link with a date picker
		{
			createButton : false,
			startDate : '01/01/2005',
			endDate : '31/12/2020'
		}).bind(
		// when the link is clicked display the date picker
		'click', function() {
			updateSelects($(this).dpGetSelected()[0]);
			$(this).dpDisplay();
			return false;
		}).bind(
		// when a date is selected update the SELECTs
		'dateSelected', function(e, selectedDate, $td, state) {
			updateSelects(selectedDate);
		}).bind('dpClosed', function(e, selected) {
			updateSelects(selected[0]);
		});

		var updateSelects = function(selectedDate) {
			var selectedDate = new Date(selectedDate);
			$('#d option[value=' + selectedDate.getDate() + ']').attr(
					'selected', 'selected');
			$('#m option[value=' + (selectedDate.getMonth() + 1) + ']').attr(
					'selected', 'selected');
			$('#y option[value=' + (selectedDate.getFullYear()) + ']').attr(
					'selected', 'selected');
		};
		// listen for when the selects are changed and update the picker
		$('#d, #m, #y').bind('change', function() {
			var d = new Date($('#y').val(), $('#m').val() - 1, $('#d').val());
			$('#date-pick').dpSetSelected(d.asString());
		});

		// default the position of the selects to today
		var today = new Date();
		updateSelects(today.getTime());

		// and update the datePicker to reflect it...
		$('#d').trigger('change');
	});
</script>

<!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
<script src="<c:url value='/js/jquery/jquery.pngFix.pack.js' />"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).pngFix();
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/pages/common/menu.jsp"%>

	<div class="clear"></div>

	<!-- start content-outer -->
	<div id="content-outer">
		<!-- start content -->
		<div id="content">
			<div id="page-heading">
				<h1>Modify User Details</h1>
			</div>

			<table border="0" width="100%" cellpadding="0" cellspacing="0"
				id="content-table">
				<tr>
					<th rowspan="3" class="sized"><img
						src="<c:url value='/images/shared/side_shadowleft.jpg' />"
						width="20" height="300" alt="" /></th>
					<th class="topleft"></th>
					<td id="tbl-border-top">&nbsp;</td>
					<th class="topright"></th>
					<th rowspan="3" class="sized"><img
						src="<c:url value='/images/shared/side_shadowright.jpg' />"
						width="20" height="300" alt="" /></th>
				</tr>
				<tr>
					<td id="tbl-border-left"></td>
					<td>
						<!--  start content-table-inner -->
						<div id="content-table-inner">
							<!--  start product-table ..................................................................................... -->
							<form:form id="ModifyUserForm" action=""
								commandName="adminCommand">
								<input type="hidden" name="deleteIds" id="deleteIds" />
								<form:hidden path="id" />
								<c:if test="${not empty adminCommand.successMsg}">
									<div id="message-green">
										<table border="0" width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td class="green-left">${adminCommand.successMsg}</td>
												<td class="green-right"><a class="close-green"><img
														src="<c:url value='/images/table/icon_close_green.gif' />"
														alt="" /> </a></td>
											</tr>
										</table>
									</div>
								</c:if>
								<!--  start step-holder -->
								<div id="step-holder">
									<div class="step-no-off">1</div>
									<div class="step-light-left">Add User details</div>
									<div class="step-light-right">&nbsp;</div>
									<div class="step-no">2</div>
									<div class="step-dark-left">Modify User</div>
									<div class="step-dark-right">&nbsp;</div>
									<div class="step-no-off">3</div>
									<div class="step-light-left">Assign Role</div>
									<div class="step-light-round">&nbsp;</div>
									<div class="clear"></div>
								</div>
								<!--  end step-holder -->
								<table border="0" width="100%" cellpadding="0" cellspacing="0"
									id="product-table">
									<tr>
										<th class="table-header-check"><a id="toggle-all"></a></th>
										<th class="table-header-repeat line-left minwidth-1"><a
											href="">Last Name</a></th>
										<th class="table-header-repeat line-left minwidth-1"><a
											href="">First Name</a>
										</th>
										<th class="table-header-repeat line-left"><a href="">Username</a>
										</th>
										<th class="table-header-repeat line-left"><a href="">Date
												of Birth</a>
										</th>
										<th class="table-header-repeat line-left"><a href="">Created
												User</a>
										</th>
										<th class="table-header-repeat line-left"><a href="">Created
												Date</a>
										</th>
										<th class="table-header-repeat line-left"><a href="">Updated
												User</a>
										</th>
										<th class="table-header-repeat line-left"><a href="">Updated
												Date</a>
										</th>
										<th class="table-header-options line-left"><a href="">Options</a>
										</th>
									</tr>

									<c:forEach var="userDetails"
										items="${adminCommand.userDetailsList}" varStatus="count">
											<c:choose>
												<c:when test="${count.index % 2 == 0 }">
													<c:set var="rowTag" value="" />
												</c:when>
												<c:otherwise>
													<c:set var="rowTag" value="alternate-row" />
												</c:otherwise>
											</c:choose>
											<c:if test="${loggedInUserName ne userDetails.username}">
											<tr class="${rowTag}">
												<td><input type="checkbox" id="userDetailsId"
													value="${userDetails.userDetailsId}" /></td>
												<td>${userDetails.lastName }</td>
												<td>${userDetails.firstName }</td>
												<td>${userDetails.username}</td>
												<td><fmt:formatDate dateStyle="medium"
														value="${userDetails.dateOfBirth}" />
												</td>
												<td>${userDetails.createdUser}</td>
												<td><fmt:formatDate dateStyle="medium"
														value="${userDetails.createdDate}" />
												</td>
												<td>${userDetails.updatedUser}</td>
												<td><fmt:formatDate dateStyle="medium"
														value="${userDetails.updatedDate}" />
												</td>
												<td class="options-width"><a href="#"
													title="Role Settings" class="icon-1 info-tooltip"></a> <a
													href="#" onclick="javascript:submitDeleteUser(this);"
													id="Delete_user" title="Delete" class="icon-2 info-tooltip"></a>
													<a href="#" title="Save" class="icon-5 info-tooltip"></a></td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</form:form>
							<!--  end product-table................................... -->
							<div class="clear"></div>
						</div> <!--  end content-table-inner  -->
					</td>
					<td id="tbl-border-right"></td>
				</tr>
				<tr>
					<th class="sized bottomleft"></th>
					<td id="tbl-border-bottom">&nbsp;</td>
					<th class="sized bottomright"></th>
				</tr>
			</table>
			<div class="clear">&nbsp;</div>

		</div>
		<!--  end content -->
		<div class="clear">&nbsp;</div>
	</div>
	<!--  end content-outer -->

	<div class="clear">&nbsp;</div>

	<%@ include file="/WEB-INF/pages/common/footer.jsp"%>

</body>
</html>