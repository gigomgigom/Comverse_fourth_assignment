$(document).ready(function () {
	
	//권한 선택 관련 이벤트 리스너
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
			
			newCard.find('.center-name').val('');
			newCard.find('.center-adr').val('');

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
	$('#register-button').click(function() {
		const validateResult = validateData();
		if(validateResult.result) {
			submitData();
		} else {
			alert(validateResult.error.join(', ')+"에서 올바르지 않은 형식이 발견되었습니다.");
		}
	});
	
	function validateData() {
		const location = $('#create-form [name=location]').val();
		const tel = $('#create-form [name=tel]').val();
		const adr = $('#create-form [name=adr]').val();
		
		var error = [];
		var result = true;
		
		const telRegex = /^\d{2,3}-\d{3,4}-\d{4}$/;
		
		if(location === '') {
			result = false;
			error.push('지부명');
		}
		if(!telRegex.test(tel)) {
			result = false;
			error.push('전화번호');
		}
		if(adr === '') {
			result = false;
			error.push('주소');
		}
		
		return {
			result,
			error
		}
	}
	function submitData() {
		
		const _csrf = $('#csrf').val();
		
		const form = $('#create-form')[0];
		const formData = new FormData(form);
		
		//산하 학습센터 목록 폼데이터에 추가하기
		$('#card-container .card').each(function() {
			if($(this).find('.center-name').val() !== '' && $(this).find('.center-adr').val() !== '') {
				var info = $(this).find('.center-name').val() + '_' + $(this).find('.center-adr').val();
				formData.append('subBranchRq', info);
			}
		})
		
		console.log($('.card-container.card'));
		
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': _csrf
			}
		})
		
		$.ajax({
			url: '/admin/manage/general/location/create-branch',
			type: 'POST',
			//enctype: 'application/x-www-urlencoded',
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false,
			success: function() {
				alert('지국이 생성되었습니다.');
				location.href="/admin/manage/general/location/list";
			},
			error: function(e) {
				alert('에러발생');
				console.log(e);
			}
		});
	}
});

