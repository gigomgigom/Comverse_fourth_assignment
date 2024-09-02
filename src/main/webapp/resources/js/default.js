// $('.sel_wrap .sel_style').on('click', function(){
//     if($(this).parent('.sel_wrap').hasClass('type_readonly')){
//         return false;
//     }else{
//         $(this).parent('.sel_wrap').toggleClass('open')
//     }
// })

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
            ,$thisIndex = $this.index()
            ,$thisP = $this.parent()
            ,$thisSB = $thisP.find('li')
            ,$thisPP = $thisP.parent()
            ,$cont = $thisPP.find('.tab_cont');

            $thisSB.removeClass('active');
            $this.addClass('active');

            $cont.removeClass('active');
            $cont.eq($thisIndex).addClass('active');
        });
    }
}
tabAct.init();

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
