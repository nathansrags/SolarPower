function enableField(objRef) {
	var enableFieldSet = $('#username,#firstName,#lastName,#personalDetailsSubmit');
	$(enableFieldSet).removeAttr('disabled');
	$('#personalDetailsSubmit').removeClass('form-disabled').addClass(
			'form-submit');
	$('#firstName').focus();
}

$(document).ready(function() {
	$(".close-green").click(
		function() {
			var disableFieldSet = $('#username,#firstName,#lastName,#personalDetailsSubmit');
			$(disableFieldSet).attr('disabled',true);
			$('#personalDetailsSubmit').removeClass('form-submit')
					.addClass('form-disabled').attr('value', 'Submit');
		});
});

function submitDeleteUser(objectRef) {
	var eventId = objectRef.id;
	var _form = document.getElementById("ModifyUserForm");
	var actionURL = "/SolarPower/admin/deleteUser";
	_form.action = actionURL;
	_form.method = "POST";
	if (deleteUser()) {
		_form.submit();
	}
}

function deleteUser() {
	var oTable = '#product-table';
	var userIdArray = new Array();
	$(oTable).find("input[id='userDetailsId']").map(function() {
		if (($(this).is(":checked"))) {
			userIdArray.push($(this).val());
		}
	});
	// alert(userIdArray);
	if (userIdArray.length > 0) {
		$('#id').val(userIdArray);
		return true;
	} else {
		alert('Please select any check boxes to delete the user');
		return false;
	}
}

function deleteUserRole(userName) {
	var userRoleId = $('#selectedUserRole_' + userName).val();
	if (userRoleId == null) {
		alert('Please select any role in User Role column to delete');
		return false;
	} else {
		$('#id').val(userRoleId);
		var _form = document.getElementById("ModifyUserForm");
		var actionURL = "/SolarPower/admin/deleteUserRole";
		_form.action = actionURL;
		_form.method = "POST";
		_form.submit();
	}

}

function updateUserRole(userName) {
	var userRole = $('#allRoles_' + userName).val();
	if (userRole == null) {
		alert('Please select any role in available roles list');
		return false;
	} else {
		$('#id').val(userRole + ';' + userName);
		var _form = document.getElementById("ModifyUserForm");
		var actionURL = "/SolarPower/admin/updateUserRole";
		_form.action = actionURL;
		_form.method = "POST";
		_form.submit();
	}

}

function addNewUser() {
	if(validateAddUserForm()){
		var _form = document.getElementById("AdminForm");
		var actionURL = '/SolarPower/admin/addNewUser';
		_form.action = actionURL;
		_form.method = "POST";
		_form.submit();
	}
}
function validateAddUserForm(){
	var inputs = $('#AdminForm input[type="text"],input[type="password"]');
	var count=0;
	$(inputs).each(function(){
		if(validateForEmpty($(this))){
			count++;
		}
	});
	//console.log(count);
	return (count==inputs.length);
}

function validateForEmpty(element){
	var error ='<div class="error-left"></div><div class="error-inner">This field is required.</div>';
	console.log(element.val() +'ffgfg');
	if(element.val()==''){
		element.removeClass('inp-form').addClass('inp-form-error');
		element.closest('td').next().html(error)
	}else{
		element.removeClass('inp-form-error').addClass('inp-form');
		element.closest('td').next().html('')
		return true;
	}
}
/*
 * $("#AdminForm").validate({ debug : true, rules : { username : { required :
 * true } }, messages : { username : { required : "required" } }, ignore : "",
 * errorClass : 'fieldError', onkeyup : false, onblur : false, errorElement :
 * 'input', submitHandler : function() { alert("alert"); }* })
 */

/*
 * $("#AdminForm").validate({ debug: true, /*highlight : function(element,
 * errorClass) { $(element).addClass('inp-form-error').removeClass('inp-form'); },
 * unhighlight : function(element, errorClass) {
 * $(element).removeClass('inp-form-error').addClass('inp-form');
 * $("input[type=text]").removeClass('inp-form'); }, rules : { input: {
 * required: true} /* username : "required", firstName : "required" /*,
 * "lastName" : { selectRequired : true }, "password" : { selectRequired : true },
 * "confirmPassword" : { selectRequired : true }, "date" : { selectRequired :
 * true }, "month" : { selectRequired : true }, "year" : { selectRequired : true } },
 * 
 * messages : { input: { required: "required" } /*username : "Please enter the
 * user name", firstName : "Please enter the first name" /*, "lastName" : {
 * selectRequired : "Please enter the last name>" }, "password" : { required:
 * "Please provide a password", minlength: "Your password must be at least 5
 * characters long" }, "confirmPassword" : { selectRequired : "password" },
 * "date" : { selectRequired : "Select date" }, "month" : { selectRequired :
 * "Please select a Month" }, "year" : { selectRequired : "Please enter a Year" }
 */
/*
 * }, errorClass: 'inp-form-error' });
 */

$.validator.addMethod("selectRequired", function(value, element, params) {
	if (value != '') {
		alert(value + ' ' + element + ' ' + params);
		return true;
	} else {
		return false;
	}
});
