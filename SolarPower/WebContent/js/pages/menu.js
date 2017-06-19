function submitMenuForm(objectRef) {
	var eventId = objectRef.id;
	var _form = document.getElementById("MenuForm");
	$('#currentPage').val(getCurrentPage(eventId));
	$('#subMenuSelected').val(getSubMenuSelected(eventId));
	var actionURL = getSelectedAction(eventId);
	var actionURLContext = "/SolarPower/";
	actionURL = actionURLContext + actionURL;
	_form.action = actionURL;
	_form.method = "POST";
	_form.submit();
}

function getSelectedAction(eventId) {
	var selectedAction;
	var splitString = eventId.split('_');
	splitString = splitString[0];
	if (splitString == 'dashBoard') {
		selectedAction = 'home';
	} else if (splitString == 'products') {
		selectedAction = 'home';
	} else if (splitString == 'Categories') {
		selectedAction = 'home';
	} else if (splitString == 'Admin') {
		var subMenu = getSubMenuSelected(eventId);
		// alert(subMenu);
		switch (subMenu) {
		case "1":
			selectedAction = 'admin';
			break;
		case "2":
			selectedAction = 'admin/modifyUser';
			break;
		case "3":
			selectedAction = 'admin/accessRoles';
			break;
		case "4":
			selectedAction = 'admin/manageRoles';
			break;
		default:
			selectedAction = 'admin';
			break;
		}
	}  else {
		selectedAction = "home";
	}
	// alert(currentPage);
	return selectedAction;
}

function getCurrentPage(eventId) {
	var currentPage;
	var splitString = eventId.split('_');
	eventId = splitString[0];
	if (eventId == 'dashBoard') {
		currentPage = 'DASHBOARD';
	} else if (eventId == 'products') {
		currentPage = 'Products';
	} else if (eventId == 'Categories') {
		currentPage = 'Categories';
	} else if (eventId == 'Admin') {
		currentPage = 'Admin';
	}
	// alert(currentPage);
	return currentPage;
}

function getSubMenuSelected(eventId) {
	var subMenuSelected;
	var splitString = eventId.split('_');
	eventId = splitString[1];
	if (eventId == 'link1') {
		subMenuSelected = "1";
	} else if (eventId == 'link2') {
		subMenuSelected = "2";
	} else if (eventId == 'link3') {
		subMenuSelected = "3";
	}else if(eventId == 'link4') {
		subMenuSelected = "4";
	}
	// alert(subMenuSelected);
	return subMenuSelected;
}


