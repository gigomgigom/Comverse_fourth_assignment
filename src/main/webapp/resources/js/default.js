// $('.sel_wrap .sel_style').on('click', function(){
//     if($(this).parent('.sel_wrap').hasClass('type_readonly')){
//         return false;
//     }else{
//         $(this).parent('.sel_wrap').toggleClass('open')
//     }
// })
//댓글 작성하기
$('#submit_comment').on('click', function(){
	const name = $('#writer_name').val();
	const pw = $('#writer_pw').val();
	const content = $('#comment_form').val();
	const boId = $('#bo_id_input').val();
	
	if(name === '') {
		alert('이름을 적어주십시오.');
		return;
	} else if(pw === '') {
		alert('비밀번호를 입력해주세요');
		return;
	} else if(content === '') {
		alert('내용을 입력해주세요');
		return;
	}
	const _csrf = $('#csrf').val();
	const formData = new FormData();
	
	formData.append('boId', boId);
	formData.append('anonWriter', name);
	formData.append('anonPw', pw);
	formData.append('content', content);
	
	$.ajaxSetup({
		headers: {
			'X-CSRF-TOKEN': _csrf
		}
	})
	
	$.ajax({
		url: '/home/board/write_reply',
		type: 'POST',
		enctype: 'multipart/form-data',
		data: formData,
		processData: false,
		contentType: false,
		success: function() {
			alert('댓글이 생성되었습니다.');
			location.reload();
		},
		error: function(e) {
			alert('에러발생');
			console.log(e);
		}
	})	
})

$('.remove_button').on('click', function(){
	const replyId = $(this).attr('id').substr(6);
	const anonPw = prompt('댓글 생성할때 지정한 비밀번호를 입력해주세요.', '');
	
	const data = {
		replyId, anonPw
	};
	if(anonPw != null) {
		$.ajax({
			url: '/home/board/delete_reply',
			type: 'GET',
			data: JSON.parse(JSON.stringify(data)),
			contentType: 'application/json',
			success: function(data) {
				if(data) {
					alert('삭제되었습니다.');
					location.reload();
				} else {
					alert('비밀번호가 잘못되었습니다.');
				}
			},
			error: function(e) {
				alert('에러발생');
				console.log(e);
			}
		})
	}
});

//사용자 지정 스크립트
$('#query-content-input').keyup(function (e) {
	let content = $(this).val();
	
	if(content.length === 0 || content === '') {
		$('#text_count .current').text('0자');
	} else if(content.length > 1000) {
		alert('1000자 이상 작성하실 수 없습니다');
	} else {
		$('#text_count .current').text(content.length + '자');
	}
});

function reset() {
	$('#inquiry-form')[0].reset();
}

function submitInquiryForm(index) {
	const validateResult = validateForm();
	const _csrf = $('#csrf').val();
	
	const form = $('#inquiry-form')[0];
	if(validateResult.result) {
		const formData = new FormData(form);
		
		formData.append('tel', validateResult.tel);
		formData.append('email', validateResult.email);
		formData.append('agree', true);
		if(index === 0) {
			formData.append('field', '학습문의');
		} else {
			formData.append('field', '1대1 문의');
		}
		
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': _csrf
			}
		})
		
		$.ajax({
			url: '/create-inquiry',
			type: 'POST',
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false,
			success: function() {
				alert('정보가 생성되었습니다.');
				location.href="/";
			},
			error: function(e) {
				alert('에러발생');
				console.log(e);
			}
		})
	} else{
		alert(validateResult.error.join(', ')+"에서 올바르지 않은 형식이 발견되었습니다.");
	}
}
function validateForm() {
	
	let result = true;
	let error = [];
	
	const tel = $('#tel-prefix').attr('data-select') + '-' + $('#inquiry-form [name="telSecond"]').val() + '-' + $('#inquiry-form [name="telThird"]').val()
	const email = $('#email_name').val()+'@'+$('#email_domain').val();
	
	const phoneRegex = /^01[016789]-\d{3,4}-\d{4}$/;
	const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	
	if($('#inquiry-form [name="name"]').val() === '') {
		result = false;
		error.push('이름');
	}
	if($('#inquiry-form [name="title"]').val() === '') {
		result = false;
		error.push('제목');
	}
	if($('#inquiry-form [name="content"]').val() === '') {
		result = false;
		error.push('내용');
	}	
	if(!phoneRegex.test(tel)) {
		result = false;
		error.push('전화번호');
	}
	if(!emailRegex.test(email)) {
		result = false;
		error.push('이메일');
	}
	if(!$('#agree').is(':checked')){
		result = false;
		error.push('개인정보 동의');
	}
	return {
		result,
		error,
		tel,
		email
	}
}

function reset() {
	$('#join-center-form')[0].reset();
}

function submitJoinCenterForm() {
	let result = true;
	let error = [];
	
	const tel = $('#tel-prefix').attr('data-select') + '-' + $('#join-center-form [name="telSecond"]').val() + '-' + $('#join-center-form [name="telThird"]').val()
	const email = $('#email_name').val()+'@'+$('#email_domain').val();
	
	const phoneRegex = /^01[016789]-\d{3,4}-\d{4}$/;
	const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	
	
	if($('#join-center-form [name="name"]').val() === '') {
		result = false;
		error.push('이름');
	}
	if($('#join-center-form [name="birthDate"]').val() === '') {
		result = false;
		error.push('생년월일');
	}
	if($('#join-center-form [name="adr"]').val() === '') {
		result = false;
		error.push('주소');
	}
	if(!phoneRegex.test(tel)) {
		result = false;
		error.push('전화번호');
	}
	if(!emailRegex.test(email)) {
		result = false;
		error.push('이메일');
	}
	if($('#living-location').attr('data-select') === ''){
		result = false;
		error.push('거주지역');
	}
	if(!$('#agree').is(':checked')){
		result = false;
		error.push('개인정보 동의');
	}
	
	if(result) {
		const _csrf = $('#csrf').val();
			
		const form = $('#join-center-form')[0];
		const formData = new FormData(form);
		
		formData.append('tel', tel);
		formData.append('email', email);
		formData.append('agree', true);
		formData.append('location', $('#living-location').attr('data-select'));
		
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': _csrf
			}
		})
		
		$.ajax({
			url: '/recruit/create-center-setup',
			type: 'POST',
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false,
			success: function() {
				alert('정보가 생성되었습니다.');
				location.href="/";
			},
			error: function(e) {
				alert('에러발생');
				console.log(e);
			}
		})
	} else {
		alert(error.join(', ')+"에서 올바르지 않은 형식이 발견되었습니다.");
	}
	
	
}

var selectAct = {
    init:function(){
        this.wrap = $('.sel_wrap .sel_style');
        this.list = $('.sel_wrap .sel_list button');
        this.addEvent();
    },
    addEvent:function(){
        this.wrap.on('click',function(){
            var $this = $(this);

            if($this.closest('.sel_wrap').hasClass('type_readonly')){
                return false;
            }else if(!$this.closest('.sel_wrap').hasClass('open')){
                $('.sel_wrap').removeClass('open');
                $this.closest('.sel_wrap').addClass('open');
            }else{
                $this.closest('.sel_wrap').removeClass('open');
            }

        });

        this.list.on('click',function(){
            var $this = $(this);
            var $text = $this.text();
            $this.closest('.sel_wrap').removeClass('open').find('.sel_style').text($text).attr('data-select',$text);
			
			const emailInput = $('#email_domain');
			if($text.indexOf('.') != -1 || $text === '직접입력') {
				if($text === '직접입력') {
					emailInput.removeClass('disabled');
					emailInput.attr('disabled', false);
					emailInput.val('');
				} else {
					emailInput.addClass('disabled');
					emailInput.attr('disabled', true);
					emailInput.val($text);
				}
			}			
        });
    }
}
selectAct.init();

/* faq accordion */
$('.btn_faq_toggle').click(function(){
    if($('.answer_area',this).css('display')=='none'){
        $('.answer_area').hide()
        $('.answer_area',this).show()
        $('.btn_faq_toggle').removeClass('on')
        $(this).addClass('on')
    }else{
        $('.answer_area',this).hide()
        $(this).removeClass('on')
    }
})
function formatDate(dateString) {
    const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];

    // Date 객체로 변환
    const date = new Date(dateString);

    // 연도, 월, 일 추출
    const year = date.getFullYear();
    const month = date.getMonth() + 1; // 월은 0부터 시작하므로 +1
    const day = date.getDate();

    // 요일 구하기
    const dayOfWeek = daysOfWeek[date.getDay()];

    // 시간 및 오전/오후 구하기
    let hours = date.getHours();
    const minutes = date.getMinutes().toString().padStart(2, '0');
    const ampm = hours < 12 ? '오전' : '오후';
    hours = hours % 12 || 12; // 0을 12로 변환

    // 최종 포맷
    return `${year}년 ${month}월 ${day}일(${dayOfWeek}) ${ampm} ${hours}:${minutes}`;
}

function resetBizApply() {
	$('#apply-form')[0].reset();
}
// 사업설명회 신청 폼 레이어 데이터 출력
function showBizPrInfoForm(prId) {
	resetBizApply();
	
	$.ajax({
		url: '/recruit/get_biz_detail?prId='+prId,
		type: 'GET',
		success: function(data) {			
			$('label[for=test1]').text(data.branchLocation);
			$('#test1').val(data.biz.prId);
			$('#choose_time').empty();
			for(const dateTime of data.biz.bizSchList) {
				var dateStr = formatDate(dateTime.prDate);
				$('#choose_time').append(
					'<div class="radio_wrap"><input type="radio" id="sch-' + dateTime.schId + '" name="schId" value="' + dateTime.schId + '"><label for="sch-' + dateTime.schId + '">' + dateStr + '</label></div>'
				)
			}			
			layerAct.layerShow('layer_ask');
		},
		error: function(e) {
			alert('에러발생');
			console.log(e);
		}
	})
}

function bizApply() {
	let result = true;
	let error = [];
	
	const tel = $('#phone1').val() + '-' + $('#phone2').val() + '-' + $('#phone3').val();
	
	const phoneRegex = /^01[016789]-\d{3,4}-\d{4}$/;
	
	if($('#apply-form [name="name"]').val() === '') {
		result = false;
		error.push('이름');
	}
	if($('#apply-form [name="hopeArea"]').val() === '') {
		result = false;
		error.push('활동희망지역');
	}
	if($('#apply-form [name="age"]').val() === '') {
		result = false;
		error.push('연령대');
	}
	if($('#apply-form [name="funnel"]').val() === '') {
		result = false;
		error.push('유입경로');
	}
	if($('#apply-form [name="funnelSub"]').val() === '') {
		result = false;
		error.push('상세 유입경로');
	}
	if(!phoneRegex.test(tel)) {
		result = false;
		error.push('전화번호');
	}
	if(!$('#agree').is(':checked')){
		result = false;
		error.push('개인정보 동의');
	}
	
	if(result) {
		const form = $('#apply-form')[0];
		const formData = new FormData(form);
		
		const _csrf = $('#csrf').val();
				
		formData.append('tel', tel);
		formData.append('channel', '홈페이지');
		formData.append('agree', true);
		
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': _csrf
			}
		})
		
		$.ajax({
			url: '/recruit/create-biz-apply',
			type: 'POST',
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false,
			success: function() {
				alert('정보가 생성되었습니다.');
				location.reload();
			},
			error: function(e) {
				alert('에러발생');
				console.log(e);
			}
		})
	} else {
		alert(error.join(', ')+"에서 올바르지 않은 형식이 발견되었습니다.");
	}
}

/* layer popup */
var layerAct = {
    init:function(){
        this.dimClick();
    },
    layerShow:function(targetLayer){
        var $target = $('.'+targetLayer)
        ,layerWrap = $target.find('.pop_wrap')
        ,showLayerTop, showLayerLeft;

        showLayerTop = ($(window).height() - $target.outerHeight(true)) / 2 + $(window).scrollTop();
        showLayerLeft = layerWrap.outerWidth()/2;

        layerWrap.css({'top' : showLayerTop, 'margin-left' : '-' + showLayerLeft + 'px'})
        $target.show();
        if($(window).height() <= $target.outerHeight()){
            $target.css('top', $(window).scrollTop())
        }
    },
    layerHide:function(targetLayer){
        var $target = $('.'+targetLayer)
        $target.hide();
    },
    dimClick:function(){
        $(document).on('click', '.dim', function(){
            $(this).parent('.layer_pop').hide();
        })
    }
}
layerAct.init();

/* tab */
var tabAct = {
    init:function(){
        this.menu = $('.tab_list li');
        this.addEvent();
    },
    addEvent:function(){
        this.menu.on('click',function(){
            var $this = $(this)			
            //,$thisIndex = $this.index()
            ,$thisP = $this.parent()
            ,$thisSB = $thisP.find('li')
            //,$thisPP = $thisP.parent()
            //,$cont = $thisPP.find('.tab_cont');
			
            $thisSB.removeClass('active');
            $this.addClass('active');
            
			getBranchDetail($this.attr('data-select'));
			//$cont.removeClass('active');
            //$cont.eq($thisIndex).addClass('active');
        });
    }
}
tabAct.init();

function getBranchDetail(brId) {
	$.ajax({
		url: '/help/get-location-detail?brId='+brId,
		type: 'GET',
		success: function(data){
			$('#branch_location').text(data.branch.location);
			$('#branch_adr').text(data.branch.adr);
			$('#branch_tel').text(data.branch.tel);
			
			$('#branch_sub').html('');
			for(const subBranch of data.subBranchList) {
				const htmlPiece = '<li><em>' + subBranch.subName + '</em><span>' + subBranch.subAdr + '</span></li>';
				$('#branch_sub').append(htmlPiece);
			}
			createMap(data.branch.adr);
		},
		error: function(e) {
			alert('에러발생');
			console.log(e);
		}
	})
}

$('.visual_wrap').animate({opacity:1}, 1500, function() {}).addClass('on');

var slideTab ={
    init:function(){
        this.menu = $('.slide_wrap2 .left_wrap .btn_wrap button');
        this.addEvent();
    },
    addEvent:function(){

        var _this = this;

        this.menu.on('click',function(){
            var $this = $(this)
            ,$thisIndex = $this.index()
            ,$cont = $this.closest('.slide_wrap2').find('.slide_con');

            _this.menu.removeClass('on');
            $this.addClass('on');

            $cont.hide();
            $cont.eq($thisIndex).show();
        });
    }
}
slideTab.init();

/* location fixed */
var locationFixed = {
    init:function(){
        this.addEvent();
    },
    addEvent:function(){
        $(window).scroll(function(){
            var $header = $("header");
            var $cont = $(".contents");
            var $location = $(".location_wrap");
            var scrTop = $(window).scrollTop();

            if (scrTop >= parseInt($cont.css("marginTop")) - $location.outerHeight()) {
                $location.addClass("fixed");
            } else {
                $location.removeClass("fixed");
            }

        });
    }
}
$('.location_wrap').length && locationFixed.init();

/* main Visual Slide */
var mainSlider = {
    define: function() {
        this.ANI_TIME = 500;
        this.PLAY_TIME = 10000;
        this.wrap = $(".main_visual_wrap");
        this.container = this.wrap.find(".slider_visual");
        this.indicator = this.wrap.find(".indicator");
        this.idx = 0;
        this.len = this.container.find("li").length;
    },
    init: function() {
        if(!$(".main_visual_wrap").length) return false;

        var _this = this;
        this.define();
        this.banner();

        this.container.find("li").eq(this.idx).fadeIn(this.ANI_TIME, function() {
            $(this).addClass("active");
        });
        this.indicator.find(".btn_navi").eq(this.idx).addClass("active");

        this.autoPlay();

        this.indicator.find(".btn_navi").on("click", function() {
            clearInterval(_this.player);
            _this.idx = $(this).index();
            _this.move(_this.idx);
            _this.autoPlay();
        });
    },
    move: function(idx) {
        this.container.find("li.active").fadeOut(this.ANI_TIME, function() {
            $(this).removeClass("active");
        });
        this.container.find("li").eq(idx).fadeIn(this.ANI_TIME, function() {
            $(this).addClass("active");
        });
        this.indicator.find(".btn_navi").removeClass("active");
        this.indicator.find(".btn_navi").eq(idx).addClass("active");
    },
    autoPlay: function() {
        var _this = this;

        this.player = setInterval(function() {
            _this.idx++;
            if(_this.idx >= _this.len) {
                _this.idx = 0;
            }
            _this.move(_this.idx);
        }, _this.PLAY_TIME);
    },
    banner: function() {
        $(document).ready(function() {
            setTimeout(function() {
                $(".main_link_wrap").addClass("active");
            });
        });
    }
}
mainSlider.init();

/* main slide */
var slideAct = {
    init:function(obj){
        this.wrap = $('.'+obj);
        this.next = this.wrap.find('.btn_wrap button').eq(1);
        this.prev = this.wrap.find('.btn_wrap button').eq(0);
        this.img = this.wrap.find('.img li');

        this.addEvent(obj);

        this.page1 = this.wrap.find('.paginate_wrap span').eq(0);
        this.page2 = this.wrap.find('.paginate_wrap span').eq(1);
        var len = this.img.length;
        this.page1.text('1');
        this.page2.text(len);
    },
    addEvent:function(obj){

        var _this = this;

        this.next.on('click',function(){
            var $this = $(this);
            var $wrap = $this.closest('.'+obj);
            var $img = $wrap.find('.img');
            var $text = $wrap.find('.text');
            var $li = $img.find('li');
            var $ti = $text.find('li');
            var $len = $img.find('li').length;
            var $index = $img.find('.active').index();
            var $page = $wrap.find('.paginate_wrap span').eq(0);

            $li.removeClass('active').hide();
            $ti.removeClass('active').hide();

            if($index === $len-1){
                $li.eq(0).addClass('active').fadeIn(300);
                $ti.eq(0).addClass('active').fadeIn(300);
                $page.text(1);
            }else{
                $li.eq($index+1).addClass('active').fadeIn(300);
                $ti.eq($index+1).addClass('active').fadeIn(300);
                $page.text($index+2);
            }

        });

        this.prev.on('click',function(){
            var $this = $(this);
            var $wrap = $this.closest('.'+obj);
            var $img = $wrap.find('.img');
            var $text = $wrap.find('.text');
            var $li = $img.find('li');
            var $ti = $text.find('li');
            var $len = $img.find('li').length;
            var $index = $img.find('.active').index();
            var $page = $wrap.find('.paginate_wrap span').eq(0);

            $li.removeClass('active').hide();
            $ti.removeClass('active').hide();

            if($index === 0){
                $li.eq($len-1).addClass('active').fadeIn(300);
                $ti.eq($len-1).addClass('active').fadeIn(300);
                $page.text($len);
            }else{
                $li.eq($index-1).addClass('active').fadeIn(300);
                $ti.eq($index-1).addClass('active').fadeIn(300);
                $page.text($index);
            }

        });
    }
}
slideAct.init('slide_js');
slideAct.init('slide_js2');
slideAct.init('slide_js3');
slideAct.init('slide_js4');

var mainScroll = {
    init:function(){
        this.addEvent();
    },
    addEvent:function(){
        $(window).scroll(function(){
            var h = $(window).scrollTop()/5;
            $('.bu_wrap .bu1').css('transform','rotate('+h+'deg)');
            $('.bu_wrap .bu2').css('transform','rotate('+h+'deg)');
            $('.bu_wrap .bu3').css('transform','rotate('+h+'deg)');
            $('.bu_wrap .bu4').css('transform','rotate('+h+'deg)');
            $('.bu_wrap .bu5').css('transform','rotate('+h+'deg)');
            $('.bu_wrap .bu6').css('transform','rotate('+h+'deg)');
        });
    }
}
$('.bu_wrap').length && mainScroll.init();



//$('.bu_wrap .bu1').addClass('on');
