//이벤트 리스너 설정
$(document).ready(() => {
	$('.main-menu').change(function() {
		mainMenuEventHandler($(this));
	})
	
	$('#submit-button').click(function() {
		createRole();
	})
})

//대메뉴 선택시 하위 요소 일괄 선택(이벤트 핸들러 설정)
const mainMenuEventHandler = (e) => {
	var classList = e.attr('class');
	var classArray = classList.split(' ');
	
	var submenu = '.sub-menu.'+classArray[1];
	
	if(e.is(':checked')) {
		$(submenu).each(function() {
			$(this).prop('checked', true);
		})
	} else {
		$(submenu).each(function() {
			$(this).prop('checked', false);
		})
	}
}

//권한 관련 데이터 세팅하는 작업
const setRequestData = () => {
	const roleId = $('#create-form [name=roleId]').val();
	const roleName = $('#create-form [name=roleName]').val();
	const roleEnabled = $('#create-form [name=roleEnabled]:checked').val();
	const roleRemovable = $('#create-form [name=roleRemovable]:checked').val();
	const _csrf = $('#csrf').val();
	
	const menuList = document.querySelectorAll('input[name="menuItems[]"]:checked');
	const boardList = document.querySelectorAll('input[name="boardItems[]"]:checked');
	const menuVal = Array.from(menuList).map(checkbox => checkbox.value);
	let boardVal;
	let isBoardEnabled = false;
	
	if(menuVal.indexOf('2') !== -1) {
		isBoardEnabled = true;
		boardVal = Array.from(boardList).map(checkbox => checkbox.value);		
	}
	
	const data = {
		"menuList": menuVal,
		"boardList": boardVal,
		roleId,
		isBoardEnabled,
		roleName,
		roleEnabled,
		roleRemovable,
		_csrf
	}
	console.log(data);
	
	return data;
}

//유효성 검사
const validateData = (data) => {
	let check = {
		'result': true,
		'input': []
	}
	
	if(data.roleName === '') {
		check.result = false;
		check.input.push('권한 명');
	}
	
	return check;
}

//통신 코드
const createRole = () => {
	//데이터 세팅
	const requestData = setRequestData();
	//유효성 검사
	const validateResult = validateData(requestData);
	
	console.log(requestData);
	if(validateResult.result) {
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': requestData._csrf
			}
		})
		$.ajax({
			url: '/admin/manage/role/auth/edit-role',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(requestData),
			success: function(rs) {
				alert('권한이 수정되었습니다.');
				location.href="/admin/manage/role/auth/list";
			},
			error: function(e) {
				console.log(e);
			}
		})
	} else {
		const msg = validateResult.input.join(', ');
		alert('옳지 않은 형식 : ' + validateResult.input);
	}
}