$(document).ready(function () {
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
	function bindRemoveCardEvent() {
        $('.remove-button').off('click').on('click', function() {
            $(this).closest('.card').remove(); // 버튼이 속한 가장 가까운 card 요소를 삭제
        });
    }
	function bindAddCardEvent() {
		// 카드 추가 버튼
	    $('.add-button').click(function() {
	        // 첫 번째 카드를 복사
	        const newCard = $(this).closest('.card').clone();

	        // 기존 카드에서 추가 버튼 제거
			const prevCard = $(this).closest('.card');
	        // 기존 카드에서 추가 버튼 제거
	        prevCard.find('.add-button').remove();
			prevCard.find('.remove-button').removeClass('d-none');
			
			newCard.find('.datetime-pick').val('');
	        // 복사한 카드를 카드 컨테이너에 추가
	        $('#card-container').append(newCard);
	        
			binding();
	    });
	}
    function binding () {
		// 처음 페이지 로드 시 카드 추가/삭제 이벤트 바인딩
	    bindRemoveCardEvent();
		bindAddCardEvent();
	}
	binding();
	
	//제출 이벤트 리스너
	$('#submit-button').click(function() {
		const validateResult = validateData();
		if(validateResult.result) {
			submitData();
		} else {
			alert(validateResult.error.join(', ')+"에서 올바르지 않은 형식이 발견되었습니다.");
		}
	});
    function validateData() {
		const brId = $('#edit-form [name=brId]').val();
		const location = $('#edit-form [name=location]').val();
		const exposeStart = $('#edit-form [name=exposeStart]').val();
		const exposeEnd = $('#edit-form [name=exposeEnd]').val();
		
		let result = true;
		let error = [];

		if(brId == 0) {
			result = false;
			error.push('지부');
		}
		if(location === '') {
			result = false;
			error.push('장소');
		}
		if(exposeEnd !== '' && exposeStart !== '') {
			var start = new Date(exposeStart);
			var end = new Date(exposeEnd);
			if(start > end) {
				result = false;
				error.push('[시작일자, 종료일자]');
			}
		}
		
		return {
			result, error
		}
	}
	function submitData() {
		const _csrf = $('#csrf').val();
		
		const form = $('#edit-form')[0];
		const formData = new FormData(form);
		
		$('#card-container .card').each(function() {
			if($(this).find('.datetime-pick').val() !== '') {
				var info = $(this).find('.datetime-pick').val();
				formData.append('dateList', info);
			}
		})
		
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': _csrf
			}
		})
		
		$.ajax({
			url: '/admin/manage/general/biz/edit-biz',
			type: 'POST',
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false,
			success: function() {
				alert('정보가 수정되었습니다.');
				location.href="/admin/manage/general/biz/list";
			},
			error: function(e) {
				alert('에러발생');
				console.log(e);
			}
		})
	}
});

