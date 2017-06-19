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
				<h1>Add product</h1>
			</div>
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

							<table border="0" width="100%" cellpadding="0" cellspacing="0">
								<tr valign="top">
									<td>
										<!--  start step-holder -->
										<div id="step-holder">
											<div class="step-no">1</div>
											<div class="step-dark-left">
												<a href="">Add product details</a>
											</div>
											<div class="step-dark-right">&nbsp;</div>
											<div class="step-no-off">2</div>
											<div class="step-light-left">Select related products</div>
											<div class="step-light-right">&nbsp;</div>
											<div class="step-no-off">3</div>
											<div class="step-light-left">Preview</div>
											<div class="step-light-round">&nbsp;</div>
											<div class="clear"></div>
										</div> <!--  end step-holder --> <!-- start id-form -->
										<table border="0" cellpadding="0" cellspacing="0" id="id-form">
											<tr>
												<th valign="top">Product name:</th>
												<td><input type="text" class="inp-form" />
												</td>
												<td></td>
											</tr>
											<tr>
												<th valign="top">Product name:</th>
												<td><input type="text" class="inp-form-error" />
												</td>
												<td>
													<div class="error-left"></div>
													<div class="error-inner">This field is required.</div></td>
											</tr>
											<tr>
												<th valign="top">Category:</th>
												<td><select class="styledselect_form_1">
														<option value="">All</option>
														<option value="">Products</option>
														<option value="">Categories</option>
														<option value="">Clients</option>
														<option value="">News</option>
												</select></td>
												<td></td>
											</tr>
											<tr>
												<th valign="top">Sub Category:</th>
												<td><select class="styledselect_form_1">
														<option value="">All</option>
														<option value="">Products</option>
														<option value="">Categories</option>
														<option value="">Clients</option>
														<option value="">News</option>
												</select></td>
												<td></td>
											</tr>
											<tr>
												<th valign="top">Price:</th>
												<td><input type="text" class="inp-form" />
												</td>
												<td></td>
											</tr>
											<tr>
												<th valign="top">Select a date:</th>
												<td class="noheight">

													<table border="0" cellpadding="0" cellspacing="0">
														<tr valign="top">
															<td>
																<form id="chooseDateForm" action="#">
																	<select id="d" class="styledselect-day">
																		<option value="">dd</option>
																		<option value="1">1</option>
																		<option value="2">2</option>
																		<option value="3">3</option>
																		<option value="4">4</option>
																		<option value="5">5</option>
																		<option value="6">6</option>
																		<option value="7">7</option>
																		<option value="8">8</option>
																		<option value="9">9</option>
																		<option value="10">10</option>
																		<option value="11">11</option>
																		<option value="12">12</option>
																		<option value="13">13</option>
																		<option value="14">14</option>
																		<option value="15">15</option>
																		<option value="16">16</option>
																		<option value="17">17</option>
																		<option value="18">18</option>
																		<option value="19">19</option>
																		<option value="20">20</option>
																		<option value="21">21</option>
																		<option value="22">22</option>
																		<option value="23">23</option>
																		<option value="24">24</option>
																		<option value="25">25</option>
																		<option value="26">26</option>
																		<option value="27">27</option>
																		<option value="28">28</option>
																		<option value="29">29</option>
																		<option value="30">30</option>
																		<option value="31">31</option>
																	</select>
																</form>
															</td>
															<td><form id="chooseDateForm" action="#">
																	<select id="m" class="styledselect-month">
																		<option value="">mmm</option>
																		<option value="1">Jan</option>
																		<option value="2">Feb</option>
																		<option value="3">Mar</option>
																		<option value="4">Apr</option>
																		<option value="5">May</option>
																		<option value="6">Jun</option>
																		<option value="7">Jul</option>
																		<option value="8">Aug</option>
																		<option value="9">Sep</option>
																		<option value="10">Oct</option>
																		<option value="11">Nov</option>
																		<option value="12">Dec</option>
																	</select>
																</form></td>
															<td><form id="chooseDateForm" action="#">
																	<select id="y" class="styledselect-year">
																		<option value="">yyyy</option>
																		<option value="2005">2005</option>
																		<option value="2006">2006</option>
																		<option value="2007">2007</option>
																		<option value="2008">2008</option>
																		<option value="2009">2009</option>
																		<option value="2010">2010</option>
																		<option value="2011">2011</option>
																		<option value="2012">2012</option>
																		<option value="2013">2013</option>
																		<option value="2014">2014</option>
																		<option value="2014">2015</option>
																	</select>
																</form>
															</td>
															<td><a href="" id="date-pick"><img
																	src="<c:url value='/images/forms/icon_calendar.jpg' />"
																	alt="" /> </a>
															</td>
														</tr>
													</table></td>
												<td></td>
											</tr>
											<tr>
												<th valign="top">Description:</th>
												<td><textarea rows="" cols="" class="form-textarea"></textarea>
												</td>
												<td></td>
											</tr>
											<tr>
												<th>Image 1:</th>
												<td><input type="file" class="file_1" />
												</td>
												<td>
													<div class="bubble-left"></div>
													<div class="bubble-inner">JPEG, GIF 5MB max per image</div>
													<div class="bubble-right"></div></td>
											</tr>
											<tr>
												<th>Image 2:</th>
												<td><input type="file" class="file_1" />
												</td>
												<td><div class="bubble-left"></div>
													<div class="bubble-inner">JPEG, GIF 5MB max per image</div>
													<div class="bubble-right"></div>
												</td>
											</tr>
											<tr>
												<th>Image 3:</th>
												<td><input type="file" class="file_1" />
												</td>
												<td><div class="bubble-left"></div>
													<div class="bubble-inner">JPEG, GIF 5MB max per image</div>
													<div class="bubble-right"></div>
												</td>
											</tr>
											<tr>
												<th>&nbsp;</th>
												<td valign="top"><input type="button" value=""
													class="form-submit" /> <input type="reset" value=""
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
														Lorem ipsum dolor sit amet consectetur adipisicing elitsed
														do eiusmod tempor.
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
														Lorem ipsum dolor sit amet consectetur adipisicing elitsed
														do eiusmod tempor.
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
														Lorem ipsum dolor sit amet consectetur adipisicing elitsed
														do eiusmod tempor.
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