$(document).ready(function () {
	$(function () {
	  bsCustomFileInput.init();
	});
	
	$(function () {
		$('#summernote').summernote( {
			height: '400px',
			width: '100%',
			lang: "ko-KR",
			disableResizeEditor: true,
			callbacks: {
				onImageUpload : (files) => {
					uploadSummernoteImageFile(files[0]);
				},
				onPaste : (e) => {
					var clipboardData = e.originalEvent.clipboardData;
					if(clipboardData && clipboardData.items && clipboardData.items.length) {
	                    var item = clipboardData.items[0];
	                    if(item.kind === 'file' && item.type.indexOf('image/') !== -1) {
	                        console.log('확인이용');
	                        e.preventDefault();
	                    }
	                }
				},
				onMediaDelete : (target) => {
					var deletedImageUrl = target.attr('src');
					const parts = deletedImageUrl.split("/");
					
					const date = parts[parts.length - 2];
	                const fileName = parts[parts.length - 1];

	                deleteSummernoteImageFile(date, fileName);
				}
				
			}
		});
	});
	$('#expose-start-check').change(function () {
		if($(this).is(':checked')) {
			$('#expose-start').prop("disabled", false);
		} else {
			$('#expose-start').val(null);
			$('#expose-start').prop("disabled", true);
		}
	})
	$('#expose-end-check').change(function () {
		if($(this).is(':checked')) {
			$('#expose-end').prop("disabled", false);
		} else {
			$('#expose-end').val(null);
			$('#expose-end').prop("disabled", true);
		}
		
	})
	$('#submit-button').click(function() {
		submitForm();
	});
})
//이미지 업로드 통신
function uploadSummernoteImageFile (file) {

	const _csrf = $('#csrf').val();
	const boCtg = $('#ctg').val();
	const formData = new FormData();
	formData.append('file', file);
	$.ajaxSetup({
		headers: {
			'X-CSRF-TOKEN': _csrf
		}
	})
	$.ajax({
		url: '/admin/board/manage/' + boCtg + '/upload-image',
		type: 'POST',
		data: formData,
		processData: false,
		contentType: false,
		cache: false,
		success: (data) => {
			if(data !== null && data !== '') {
				$('#summernote').summernote('insertImage', 'http://localhost'+data);
			}
		},
		error: (e) => {
			console.log('오류발생');
		}
	})
}
//이미지 삭제 통신
function deleteSummernoteImageFile(date, fileName) {
	const boCtg = $('#ctg').val();
	$.ajax({
		url: '/admin/board/manage/' + boCtg + '/delete-image/' + date + '/' + fileName,
		type: 'GET',
		success: (data) => {
			console.log(data);
		},
		error: (e) => {
			console.log('오류발생');
		}
	})
}
//입력한 내용으로 구성된 객체 생성
function submitForm() {
	let data = {};
	
	data.boTitle = $('#create-form [name=boTitle]').val();
	data.boContent = $('#summernote').val();
	data.exposeStart = $('#create-form [name=exposeStart]').val();
	data.exposeEnd = $('#create-form [name=exposeEnd]').val();
	
	const validate = validateForm(data);
	
	if(!validate.result) {
		const msg = validate.msgList.join(', ');
		alert('옳지 않은 형식 : ' + msg);
	} else {
		uploadData();
	}
	
}
//유효성 검사
function validateForm(data) {
	var result = true;
	var msgList = [];
	
	if(data.boTitle === '') {
		result = false;
		msgList.push('제목');
	}
	if(data.boContent === '') {
		result = false;
		msgList.push('내용');
	}
	if(data.exposeEnd !== '' && data.exposeStart !== '') {
		var exposeStart = new Date(data.exposeStart);
		var exposeEnd = new Date(data.exposeEnd);
		if(exposeStart > exposeEnd) {
			result = false;
			msgList.push('[시작일자, 종료일자]');
		}
	}
	return {
		result,
		msgList
	};
}
//폼 데이터 업로드
function uploadData() {
	const _csrf = $('#csrf').val();
	const boCtg = $('#ctg').val();
	
	const form = $('#create-form')[0];	
	const formData = new FormData(form);
	
	//첨부파일 목록 업로드
	const files = $('#input-attach')[0].files;
	$.each(files, function(index, file) {
		formData.append('boAttach', file);
	});
	
	$.ajaxSetup({
		headers: {
			'X-CSRF-TOKEN': _csrf
		}
	})
	$.ajax({
		url: '/admin/board/manage/' + boCtg + '/create-board',
		type: 'POST',
		enctype: 'multipart/form-data',
		data: formData,
		processData: false,
		contentType: false,
		success: () => {
			alert('게시글이 생성되었습니다.');
			location.href='/admin/board/manage/' + boCtg + '/list'
		},
		error: (e) => {
			console.log('오류발생');
		}
	})
}