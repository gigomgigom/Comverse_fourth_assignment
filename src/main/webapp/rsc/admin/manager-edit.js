$(document).ready(function () {
	$('#email-check').click(function() {
		checkAdminInfoExist(2, $('#edit-form [name=admEmail]').val());
	});
	
	function checkAdminInfoExist(ctg, line) {
		$.ajax({
			url: '/admin/manage/manager/is-exist?ctg='+ctg+'&line='+line,
			type: 'GET',
			success: function(rs) {
				if(ctg === 1) {
					if(rs) {
						alert('이미 존재하는 아이디입니다.');
					} else {
						alert('사용가능한 아이디입니다.');
					}
				} else {
					if(rs) {
						alert('이미 존재하는 이메일입니다.');	
					} else {
						alert('사용가능한 이메일입니다.');
					}
				}
			},
			error: function(e) {
				console.log(e);
			}
		})
	}
	
	
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
			const prevCard = $(this).closest('.card');
	        // 기존 카드에서 추가 버튼 제거
	        prevCard.find('.add-button').remove();
			prevCard.find('.remove-button').removeClass('d-none');
			

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
		const data = getData();
		const validateResult = validateData(data);
		if(validateResult.result) {
			submitData(data);
		} else {
			alert(validateResult.error.join(', ')+"에서 올바르지 않은 형식이 발견되었습니다.");
		}
	});
	
	function getData() {
		const admNo = $('#edit-form [name=admNo]').val();
		const admName = $('#edit-form [name=admName]').val();
		const admPw = $('#edit-form [name=admPw]').val();
		const admTel = $('#edit-form [name=admTel]').val();
		const admEmail = $('#edit-form [name=admEmail]').val();
		const admTeam = $('#edit-form [name=admTeam]').val();
		const admStts = $('#edit-form [name=admStts]').val();
		const _csrf = $('#csrf').val();
		const role = $('select[name="roleList[]"]').map(function() {
			return $(this).val();
		}).get();
		const roleSet = new Set(role);
		const roleList = [...roleSet];
		
		return {
			admNo, admName, admPw, admTel, admEmail, admTeam, admStts, roleList, _csrf
		}		
	}
    function validateData(data) {
		const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d|.*\W)[A-Za-z\d\W]{8,16}$/;
		const phoneRegex = /^01[016789]-\d{3,4}-\d{4}$/;
		const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		
		let result = true;
		let error = [];
		console.log(data);
		if(data.admPw !== '') {
			if(!passwordRegex.test(data.admPw)) {
				result = false;
				error.push('비밀번호');
			}
		}
		if(!phoneRegex.test(data.admTel)) {
			result = false;
			error.push('연락처');
		}
		if(!emailRegex.test(data.admEmail)) {
			result = false;
			error.push('이메일');
		}
		
		return {
			result, error
		}
	}
	function submitData(data) {
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': data._csrf
			}
		})
		
		$.ajax({
			url: '/admin/manage/manager/edit-manager',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(data),
			success: function() {
				alert('관리자정보가 수정되었습니다.');
				location.href="/admin/manage/manager/list";
			},
			error: function(e) {
				alert('에러발생');
				console.log(e);
			}
		})
	}
});

