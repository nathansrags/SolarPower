<%@ include file="/WEB-INF/pages/tagLib.jsp"%>

<c:set var="homeCommand" value="${homeCommand}" />
<c:set var="loggedInUserName" value="${pageContext.request.userPrincipal.name}"/>
<input type="hidden" value="${homeCommand.currentPage}" />
<script src="<c:url value='/js/pages/menu.js' />" type="text/javascript"></script>
<script src="<c:url value='/js/pages/admin.js' />" type="text/javascript"></script>
<!-- Start: page-top-outer -->
<div id="page-top-outer">

	<!-- Start: page-top -->
	<div id="page-top">

		<!-- start logo -->
		<div id="logo">
			<a href=""><img src="<c:url value='/images/shared/logo.png' />"
				width="156" height="60" alt="" /> </a>
		</div>
		<!-- end logo -->

		<!--  start top-search -->
		<div id="top-search">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<div
							style="color: #FFFFFF; font-size: 13px; font-family: Tahoma; line-height: 35px; font-weight: bold;">
							Welcome ${loggedInUserName}</div>
					</td>
					<td><input type="text" value="Search"
						onblur="if (this.value=='') { this.value='Search'; }"
						onfocus="if (this.value=='Search') { this.value=''; }"
						class="top-search-inp" />
					</td>
					<td><select class="styledselect">
							<option value="">All</option>
							<option value="">Products</option>
							<option value="">Categories</option>
							<security:authorize ifAnyGranted="ROLE_ADMIN">
							<option value="">Admin</option>
							</security:authorize>
					</select></td>
					<td><input type="image"
						src="<c:url value='/images/shared/top_search_btn.gif' />" /></td>
				</tr>
			</table>
		</div>
		<!--  end top-search -->
		<div class="clear"></div>

	</div>
	<!-- End: page-top -->

</div>
<!-- End: page-top-outer -->

<div class="clear">&nbsp;</div>
<!--  start nav-outer-repeat................................................................................................. START -->
<form:form name="MenuForm" id="MenuForm" commandName="homeCommand"
	action="">
	<form:hidden path="currentPage" />
	<form:hidden path="subMenuSelected" />
	<div class="nav-outer-repeat">
		<!--  start nav-outer -->
		<div class="nav-outer">

			<!-- start nav-right -->
			<div id="nav-right">

				<div class="nav-divider">&nbsp;</div>
				<div class="showhide-account">
					<img src="<c:url value='/images/shared/nav_myaccount.gif' />"
						width="93" height="14" alt="" />
				</div>
				<div class="nav-divider">&nbsp;</div>
				<a href="<c:url value='/j_spring_security_logout' />" id="logout"><img
					src="<c:url value='/images/shared/nav_logout.gif' />" width="64"
					height="14" alt="" /> </a>
				<div class="clear">&nbsp;</div>

				<!--  start account-content -->
				<div class="account-content">
					<div class="account-drop-inner">
						<a href="" id="acc-settings">Settings</a>
						<div class="clear">&nbsp;</div>
						<div class="acc-line">&nbsp;</div>
						<a href="<c:url value='/personalDetails' />" id="acc-details">Personal
							details </a>
						<div class="clear">&nbsp;</div>
						<div class="acc-line">&nbsp;</div>
						<a href="" id="acc-project">Project details</a>
						<div class="clear">&nbsp;</div>
						<div class="acc-line">&nbsp;</div>
						<a href="<c:url value='/inbox' />" id="acc-inbox">Inbox</a>
						<div class="clear">&nbsp;</div>
						<div class="acc-line">&nbsp;</div>
						<a href="" id="acc-stats">Statistics</a>
						<div class="clear">&nbsp;</div>
						<div class="acc-line">&nbsp;</div>
						<a href="<c:url value='/changePassword' />" id="change-password">Change Password</a>
					</div>
				</div>
				<!--  end account-content -->

			</div>
			<!-- end nav-right -->
			<!--  start nav -->
			<div class="nav">
				<div class="table">
					<c:choose>
						<c:when test="${homeCommand.currentPage eq 'DASHBOARD'}">
							<ul class="current">
								<li><a href="#" onclick="javascript:submitMenuForm(this);"
									id="dashBoard_link1"><b>Dashboard </b> </a>
									<div class="select_sub show">
										<ul class="sub">
											<li
												<c:if test="${homeCommand.subMenuSelected eq 1}">class="sub_show"</c:if>><a
												href="#" onclick="javascript:submitMenuForm(this);"
												id="dashBoard_link1">Dashboard Details 1</a></li>
											<li
												<c:if test="${homeCommand.subMenuSelected eq 2}">class="sub_show"</c:if>><a
												href="#" onclick="javascript:submitMenuForm(this);"
												id="dashBoard_link2">Dashboard Details 2</a></li>
											<li
												<c:if test="${homeCommand.subMenuSelected eq 3}">class="sub_show"</c:if>><a
												href="#" onclick="javascript:submitMenuForm(this);"
												id="dashBoard_link3">Dashboard Details 3</a></li>
										</ul>
									</div>
								</li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="select">
								<li><a href="#" onclick="javascript:submitMenuForm(this);"
									id="dashBoard_link1"><b>Dashboard </b> </a>
									<div class="select_sub">
										<ul class="sub">
											<li><a href="#"
												onclick="javascript:submitMenuForm(this);"
												id="dashBoard_link1">Dashboard Details 1</a>
											</li>
											<li><a href="#"
												onclick="javascript:submitMenuForm(this);"
												id="dashBoard_link2">Dashboard Details 2</a>
											</li>
											<li><a href="#"
												onclick="javascript:submitMenuForm(this);"
												id="dashBoard_link3">Dashboard Details 3</a>
											</li>
										</ul>
									</div> <!--[if lte IE 6]></td></tr></table></a><![endif]--></li>
							</ul>
						</c:otherwise>
					</c:choose>

					<div class="nav-divider">&nbsp;</div>
					<c:choose>
						<c:when test="${homeCommand.currentPage eq 'Products'}">
							<ul class="current">
								<li><a href="#" onclick="javascript:submitMenuForm(this);"
									id="products_link1"><b>Products </b> </a>
									<div class="select_sub show">
										<ul class="sub">
											<li
												<c:if test="${homeCommand.subMenuSelected eq 1}">class="sub_show"</c:if>><a
												href="#" onclick="javascript:submitMenuForm(this);"
												id="products_link1">View all products</a></li>
											<li
												<c:if test="${homeCommand.subMenuSelected eq 2}">class="sub_show"</c:if>><a
												href="#" onclick="javascript:submitMenuForm(this);"
												id="products_link2">Add product</a></li>
											<li
												<c:if test="${homeCommand.subMenuSelected eq 3}">class="sub_show"</c:if>><a
												href="#" onclick="javascript:submitMenuForm(this);"
												id="products_link3">Delete products</a></li>
										</ul>
									</div>
								</li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="select">
								<li><a href="#" onclick="javascript:submitMenuForm(this);"
									id="products_link1"><b>Products </b> </a>
									<div class="select_sub">
										<ul class="sub">
											<li><a href="#"
												onclick="javascript:submitMenuForm(this);"
												id="products_link1">View all products</a>
											</li>
											<li><a href="#"
												onclick="javascript:submitMenuForm(this);"
												id="products_link2">Add product</a>
											</li>
											<li><a href="#"
												onclick="javascript:submitMenuForm(this);"
												id="products_link3">Delete products</a>
											</li>
										</ul>
									</div></li>
							</ul>
						</c:otherwise>
					</c:choose>

					<div class="nav-divider">&nbsp;</div>
					<c:choose>
						<c:when test="${homeCommand.currentPage eq 'Categories'}">
							<ul class="current">
								<li><a href="#" onclick="javascript:submitMenuForm(this);"
									id="Categories_link1"><b>Categories </b> </a>
									<div class="select_sub show">
										<ul class="sub">
											<li
												<c:if test="${homeCommand.subMenuSelected eq 1}">class="sub_show"</c:if>><a
												href="#" onclick="javascript:submitMenuForm(this);"
												id="Categories_link1">View all Categories</a></li>
											<li
												<c:if test="${homeCommand.subMenuSelected eq 2}">class="sub_show"</c:if>><a
												href="#" onclick="javascript:submitMenuForm(this);"
												id="Categories_link2">Add Categories</a></li>
											<li
												<c:if test="${homeCommand.subMenuSelected eq 3}">class="sub_show"</c:if>><a
												href="#" onclick="javascript:submitMenuForm(this);"
												id="Categories_link3">Delete Categories</a></li>
										</ul>
									</div>
								</li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="select">
								<li><a href="#" onclick="javascript:submitMenuForm(this);"
									id="Categories_link1"><b>Categories </b> </a>
									<div class="select_sub">
										<ul class="sub">
											<li><a href="#"
												onclick="javascript:submitMenuForm(this);"
												id="Categories_link1">View all Categories</a>
											</li>
											<li><a href="#"
												onclick="javascript:submitMenuForm(this);"
												id="Categories_link2">Add Categories</a>
											</li>
											<li><a href="#"
												onclick="javascript:submitMenuForm(this);"
												id="Categories_link3">Delete Categories</a>
											</li>
										</ul>
									</div></li>
							</ul>
						</c:otherwise>
					</c:choose>

					<div class="nav-divider">&nbsp;</div>
					<security:authorize ifAnyGranted="ROLE_ADMIN">
						<c:choose>
							<c:when test="${homeCommand.currentPage eq 'Admin'}">
								<ul class="current">
									<li><a href="#" onclick="javascript:submitMenuForm(this);"
										id="Admin_link1"><b>Admin </b> </a>
										<div class="select_sub show">
											<ul class="sub">
												<li
													<c:if test="${homeCommand.subMenuSelected eq 1}">class="sub_show"</c:if>><a
													href="#" onclick="javascript:submitMenuForm(this);"
													id="Admin_link1">Add New User</a>
												</li>
												<li
													<c:if test="${homeCommand.subMenuSelected eq 2}">class="sub_show"</c:if>><a
													href="#" onclick="javascript:submitMenuForm(this);"
													id="Admin_link2">Modify User</a>
												</li>
												<li
													<c:if test="${homeCommand.subMenuSelected eq 3}">class="sub_show"</c:if>><a
													href="#" onclick="javascript:submitMenuForm(this);"
													id="Admin_link3">Access Roles</a>
												</li>
												<li
													<c:if test="${homeCommand.subMenuSelected eq 4}">class="sub_show"</c:if>><a
													href="#" onclick="javascript:submitMenuForm(this);"
													id="Admin_link4">Add Roles</a>
												</li>
											</ul>
										</div></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="select">
									<li><a href="#" onclick="javascript:submitMenuForm(this);"
										id="Admin_link1"><b>Admin </b> </a>
										<div class="select_sub">
											<ul class="sub">
												<li><a href="#"
													onclick="javascript:submitMenuForm(this);" id="Admin_link3">Add
														New User</a>
												</li>
												<li><a href="#"
													onclick="javascript:submitMenuForm(this);" id="Admin_link3">Modify
														User</a>
												</li>
												<li><a href="#"
													onclick="javascript:submitMenuForm(this);" id="Admin_link3">Access
														Roles</a>
												</li>
												<li>
													<a href="#" onclick="javascript:submitMenuForm(this);"
														id="Admin_link4">Add Roles</a>
												</li>
											</ul>
										</div></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</security:authorize>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<!--  start nav -->

		</div>
		<div class="clear"></div>
		<!--  start nav-outer -->
	</div>
</form:form>
<!--  start nav-outer-repeat................................................... END -->