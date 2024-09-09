//게시판 카테고리 상세 조회
const selectBoardCtg = (ctgId) => {
		$.ajax({
			url : '/admin/board/setting/show?ctgId='+ctgId,
			type : 'GET',
			dataType : 'json',
			success : (data) => {
				console.log(data);
				showBoardCtg(data);
			},
			error : function() {
				console.log('오류발생');
		}
	})
}
const showBoardCtg = (data) => {
	$('#board-detail [name=ctgId]').val(data.ctgId);
	$('#board-detail [name=ctgName]').val(data.ctgName);
	$('#board-detail [name=ctgMenu]').val(data.ctgMenu);
	if(data.ctgInUse) {
		$('#input-usable1').prop('checked', 'true');
	} else {
		$('#input-usable2').prop('checked', 'true');
	}
	
	if(data.newExpose) {
		$('#input-exposable1').prop('checked', 'true');
		$('#board-detail [name=exposePeriod]').val(data.exposePeriod);
	} else {
		$('#input-exposable2').prop('checked', 'true');
		$('#board-detail [name=exposePeriod]').val(data.exposePeriod);
	}
}
//새 게시판 생성
const createNewCtg = () => {
	console.log('실행');
	$.ajax({
		url: '/admin/board/setting/create',
		type: 'GET',
		success: function() {
			location.reload(true);
		},
		error: function() {
			console.log('에러발생');
		}
	})
}
//게시판 수정
const editBoardCtg = () => {
	
	let isDataOk = true;
	const name = $('#board-detail [name=ctgName]').val();
	const menu = $('#board-detail [name=ctgMenu]').val();
	const expose = $('#board-detail [name=newExpose]').val();
	const period = $('#board-detail [name=exposePeriod]').val();
	if(name === '' || menu === '') {
		isDataOk = false;
	}
	if(expose && period === 0) {
		isDataOk = false;
	}
	
	if(isDataOk) {
		const form = document.getElementById('board-detail');
		const formData = new FormData(form);
		$.ajax({
			url: '/admin/board/setting/edit',
			type: 'POST',
			data: formData,
			contentType: false,
			processData: false,
			success: function() {
				alert('성공적으로 수정되었습니다.');
				location.reload(true);
			},
			error: function() {
				console.log('에러 발생');
			}
		});
	} else {
		alert('수정 형식이 올바르지 않습니다. 다시 한번 확인해주십시오.');
	}
	
}
//게시판 삭제
const removeBoardCtg = () => {
	const ctgId = $('#board-detail [name=ctgId]').val();
	
	$.ajax({
		url: '/admin/board/setting/delete?ctgId='+ctgId,
		type: 'GET',
		success: function() {
			alert('성공적으로 삭제되었습니다.');
			location.reload(true);
		},
		error: function() {
			console.log('에러발생');
		}
	})
}
selectBoardCtg(1);