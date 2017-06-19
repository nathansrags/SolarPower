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
			$('#mainform input[type=checkbox]').checkBox('toggle');
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
				<h1>Personal Details</h1>
			</div>
			<form:form name="personalDetailsForm" id="personalDetailsForm"
				action="/SolarPower/personalDetails/saveUserDetails"
				commandName="personalDetailsCommand">
				<form:hidden path="userDetailsId" />
				<table border="0" width="100%" cellpadding="0" cellspacing="0"
					id="content-table">
					<tr>
						<th rowspan="3" class="sized"><img
							src="<c:url value='/images/shared/side_shadowleft.jpg' />"
							width="20" height="300" alt="" />
						</th>
						<th class="topleft"></th>
						<td id="tbl-border-top">&nbsp;</td>
						<th class="topright"></th>
						<th rowspan="3" class="sized"><img
							src="<c:url value='/images/shared/side_shadowright.jpg' />"
							width="20" height="300" alt="" />
						</th>
					</tr>
					<tr>
						<td id="tbl-border-left"></td>
						<td>
							<!--  start content-table-inner -->
							<div id="content-table-inner">
								<c:choose>
									<c:when test="${personalDetailsCommand.tempMsg eq 'NO DATA'}">
										<div id="message-red">
											<table border="0" width="100%" cellpadding="0"
												cellspacing="0">
												<tr>
													<td class="red-left">Personal Details doesn't exist <a
														href="#" onclick="javascript:enableField(this);"
														id="enablePersonalFields">Add personal data.</a></td>
													<td class="red-right"><a class="close-red"><img
															src="<c:url value='/images/table/icon_close_red.gif' />"
															alt="" /> </a></td>
												</tr>
											</table>
										</div>
									</c:when>
									<c:otherwise>
										<div id="message-green">
											<table border="0" width="100%" cellpadding="0"
												cellspacing="0">
												<tr>
													<td class="green-left"><a href="#"
														onclick="javascript:enableField(this);"
														id="enablePersonalFields">Edit personal data.</a> <br />
													<br /></td>
													<td class="green-right"><a class="close-green"><img
															src="<c:url value='/images/table/icon_close_green.gif' />"
															alt="" /> </a></td>
												</tr>
												<c:if test="${ not empty personalDetailsCommand.tempMsg}">
												<tr>
													<td class="yellow-left">${personalDetailsCommand.tempMsg}
													</td>
													<td class="yellow-right"><a class="close-green"><img
															src="<c:url value='/images/table/icon_close_yellow.gif' />"
															alt="" /> </a></td>
												</tr>
												</c:if>
											</table>
										</div>
									</c:otherwise>
								</c:choose>
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
									<tr valign="top">
										<td>
											<!-- start id-form -->
											<table border="0" cellpadding="0" cellspacing="0"
												id="id-form">
												<tr>
													<th valign="top">Username:</th>
													<td><form:input cssClass="inp-form" path="username"
															readonly="${'true'}" />
													</td>
													<td></td>
												</tr>
												<tr>
													<th valign="top">First name</th>
													<td><form:input cssClass="inp-form" path="firstName"
															disabled="${'true'}" />
													</td>
													<td></td>
												</tr>
												<tr>
													<th valign="top">Last Name:</th>
													<td><form:input cssClass="inp-form" path="lastName"
															disabled="${'true'}" />
													</td>
													<td></td>
												</tr>
												<tr>
													<th valign="top">Date of Birth</th>
													<td><fmt:formatDate dateStyle="medium"
															value="${personalDetailsCommand.dateOfBirth}" /></td>
													<td></td>
												</tr>
												<tr>
													<th valign="top">Created User:</th>
													<td>${personalDetailsCommand.createdUser}</td>
													<td></td>
												</tr>
												<tr>
													<th valign="top">Created Date:</th>
													<td><fmt:formatDate dateStyle="medium"
															value="${personalDetailsCommand.createdDate}" />
													</td>
													<td></td>
												</tr>
												<tr>
													<th valign="top">Updated Date:</th>
													<td><fmt:formatDate dateStyle="medium"
															value="${personalDetailsCommand.updatedDate}" />
													</td>
													<td></td>
												</tr>
												<tr>
													<th valign="top">Updated User:</th>
													<td>${personalDetailsCommand.updatedUser}</td>
													<td></td>
												</tr>
												<tr>
													<th>&nbsp;</th>
													<td valign="top"><input type="submit" value="Submit"
														id="personalDetailsSubmit" class="form-disabled"
														disabled="disabled" /> <input type="reset" value=""
														class="form-reset" /></td>
													<td></td>
												</tr>
											</table> <!-- end id-form  --></td>
										<td>
											<!--  start related-activities -->
											<div id="related-activities">

												<!--  start related-act-top -->
												<div id="related-act-top">
													<img
														src="<c:url value='/images/forms/header_related_act.gif' />"
														width="271" height="43" alt="" />
												</div>
												<!-- end related-act-top -->

												<!--  start related-act-bottom -->
												<div id="related-act-bottom">

													<!--  start related-act-inner -->
													<div id="related-act-inner">

														<div class="left">
															<a href=""><img
																src="<c:url value='/images/forms/icon_plus.gif' />"
																width="21" height="21" alt="" /> </a>
														</div>
														<div class="right">
															<h5>Add another product</h5>
															Lorem ipsum dolor sit amet consectetur adipisicing
															elitsed do eiusmod tempor.
															<ul class="greyarrow">
																<li><a href="">Click here to visit</a>
																</li>
																<li><a href="">Click here to visit</a></li>
															</ul>
														</div>

														<div class="clear"></div>
														<div class="lines-dotted-short"></div>

														<div class="left">
															<a href=""><img
																src="<c:url value='/images/forms/icon_minus.gif' />"
																width="21" height="21" alt="" /> </a>
														</div>
														<div class="right">
															<h5>Delete products</h5>
															Lorem ipsum dolor sit amet consectetur adipisicing
															elitsed do eiusmod tempor.
															<ul class="greyarrow">
																<li><a href="">Click here to visit</a>
																</li>
																<li><a href="">Click here to visit</a></li>
															</ul>
														</div>

														<div class="clear"></div>
														<div class="lines-dotted-short"></div>

														<div class="left">
															<a href=""><img
																src="<c:url value='/images/forms/icon_edit.gif' />"
																width="21" height="21" alt="" /> </a>
														</div>
														<div class="right">
															<h5>Edit categories</h5>
															Lorem ipsum dolor sit amet consectetur adipisicing
															elitsed do eiusmod tempor.
															<ul class="greyarrow">
																<li><a href="">Click here to visit</a>
																</li>
																<li><a href="">Click here to visit</a></li>
															</ul>
														</div>
														<div class="clear"></div>

													</div>
													<!-- end related-act-inner -->
													<div class="clear"></div>

												</div>
												<!-- end related-act-bottom -->

											</div> <!-- end related-activities --></td>
									</tr>
									<tr>
										<td><img src="<c:url value='/images/shared/blank.gif' />"
											width="695" height="1" alt="blank" />
										</td>
										<td></td>
									</tr>
								</table>

								<div class="clear"></div>


							</div> <!--  end content-table-inner  --></td>
						<td id="tbl-border-right"></td>
					</tr>
					<tr>
						<th class="sized bottomleft"></th>
						<td id="tbl-border-bottom">&nbsp;</td>
						<th class="sized bottomright"></th>
					</tr>
				</table>
			</form:form>
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