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
				<h1>Access User Roles</h1>
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
							<form:form id="ModifyUserForm" action="" commandName="adminCommand">
								<input type="hidden" name="deleteIds" id="deleteIds" />
								<form:hidden path="id" />
								<c:if test="${not empty adminCommand.successMsg}">
									<div id="message-red">
										<table border="0" width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td class="red-left">${adminCommand.successMsg}</td>
												<td class="red-right"><a class="close-red"><img
														src="<c:url value='/images/table/icon_close_red.gif' />"
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
									<div class="step-no-off">2</div>
									<div class="step-light-left">Modify User</div>
									<div class="step-light-right">&nbsp;</div>
									<div class="step-no">3</div>
									<div class="step-dark-left">Assign Role</div>
									<div class="step-dark-round">&nbsp;</div>
									<div class="clear"></div>
								</div>
								<!--  end step-holder -->
								<table border="0" cellpadding="0" cellspacing="0"
									id="product-table">
									<tr>
										<th class="table-header-repeat line-left" style="width:auto"><a href="">User name &nbsp;&nbsp;</a>
										</th>
										<th class="table-header-options line-left"><a href="">User Role</a>
										</th>
										<th class="table-header-options line-left"><a href="#">List of Available Roles</a>
										</th>
										<th class="table-header-options line-left"><a href="">Options</a>
										</th>
									</tr>
									<c:set var="countIndex" value="0" scope="page"/>
									<c:forEach var="userDetails"
										items="${adminCommand.userDetailsList}" varStatus="count">
										<c:if test="${loggedInUserName ne userDetails.username}">
											<c:set var="countIndex" value="${countIndex+1}" scope="page"/>
											<c:choose>
												<c:when test="${countIndex % 2 == 0 }">
													<c:set var="rowTag" value="" />
												</c:when>
												<c:otherwise>
													<c:set var="rowTag" value="alternate-row" />
												</c:otherwise>
											</c:choose>
											<tr class="${rowTag}">
												<td>${userDetails.username}</td>
												<td>
												<select name="userRole" id="selectedUserRole_${userDetails.username}" class="form_multiple" multiple="multiple">
													<c:forEach items="${userDetails.userRole}" var="roles">
														<option value="${roles.userRoleId}"
															 ${roles.role == userDetails.userRole?'selected="selected"':''}>${roles.role}</option>
													</c:forEach>
												</select>
											</td>
												<td>
												<select name="allRoles" id="allRoles_${userDetails.username}" multiple="multiple">
													<c:forEach items="${adminCommand.securityRole}" var="securityRole">
															<option value="${securityRole.security_role_cd}">${securityRole.security_role_cd}</option>
														</c:forEach>
												</select>
												</td>
												<td class="options-width">
													<a href="#" onclick="javascript:deleteUserRole('${userDetails.username}');"	id="deleteUserRole" title="Delete Role" class="icon-2 info-tooltip"></a>
													<a href="#" onclick="javascript:updateUserRole('${userDetails.username}');" id="updateUserRole" title="Assign Role to the user" class="icon-4 info-tooltip" ></a>
													<a href="#" title="Save" class="icon-5 info-tooltip"></a>
												</td>
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