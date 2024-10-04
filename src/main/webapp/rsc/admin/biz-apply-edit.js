$(document).ready(function () {
	$('#select-biz').change(function () {
		const prId = $(this).val();
		getPrSchList(prId);
	})
	function getPrSchList(prId) {
		$.ajax({
			url: '/admin/manage/general/biz-apply/get-sch-list?prId='+prId,
			type: 'GET',
			success: function(data){
				$('#select-sch').html('');
				$('#select-sch').append('<option value=0 selected>선택</option>');
				for(const sch of data) {
					var dateString = sch.prDate + '';
					var date = dateString.replace('T', ' ').slice(0, 16);
					$('#select-sch').append('<option value=' + sch.schId + '>' + date + '</option>');
				}
			},
			error: function(e) {
				alert('에러발생');
				console.log(e);
			}
		})
	}
	
	//제출 이벤트 리스너
	$('#register-button').click(function() {
		const validateResult = validateData();
		if(validateResult.result) {
			submitData();
		} else {
			alert(validateResult.error.join(', ')+"에서 올바르지 않은 형식이 발견되었습니다.");
		}
	});
    function validateData() {
		const phoneRegex = /^01[016789]-\d{3,4}-\d{4}$/;
		
		let result = true;
		let error = [];

		if($('#edit-form [name="name"]').val() === '') {
			result = false;
			error.push('이름');
		}
		if($('#edit-form [name="prId"]').val() == 0) {
			result = false;
			error.push('설명회');
		}
		if($('#edit-form [name="schId"]').val() == 0) {
			result = false;
			error.push('일시');
		}
		if($('#edit-form [name="hopeArea"]').val() === '') {
			result = false;
			error.push('희망지역');
		}
		if($('#edit-form [name="age"]').val() == 0) {
			result = false;
			error.push('연령대');
		}
		if($('#edit-form [name="funnelSub"]').val() == 0) {
			result = false;
			error.push('상세 유입경로');
		}
		if(!phoneRegex.test($('#edit-form [name="tel"]').val())) {
			result = false;
			error.push('연락처');
		}
		if(!$('#agree-check').is(':checked')){
			result = false;
			error.push('개인정보 동의');
		}
		
		return {
			result, error
		}
	}
	function submitData() {
		const _csrf = $('#csrf').val();
		
		const form = $('#edit-form')[0];
		const formData = new FormData(form);
		
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': _csrf
			}
		})
		
		$.ajax({
			url: '/admin/manage/general/biz-apply/edit-biz-apply',
			type: 'POST',
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false,
			success: function() {
				alert('정보가 수정되었습니다.');
				location.href="/admin/manage/general/biz-apply/list";
			},
			error: function(e) {
				alert('에러발생');
				console.log(e);
			}
		})
	}
});

