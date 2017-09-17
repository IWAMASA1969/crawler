// JavaScript Document


//windowサイズが568で行動を制限


/* -------------------------------------------------------------------

開閉メニューの動作設定(faq)
------------------------------------------------------------------- */

$(document).ready(function () {


	$('.w_newsarea dd').hide();
	$('.w_newsarea dt').click(function(){
		$(this).next('dd').slideToggle('fast');
		$(this).toggleClass('active');
	});


});



/* ----------------------------------------------------------------------------------
　モバイル用グローバルメニュー表示
---------------------------------------------------------------------------------- */
jQuery(document).ready(function(){
	
	$('.menubtn img').click(function(){
		if($('.menubtn').is('.menu_on')){
		$('#gl_gm').slideToggle('fast');
			$('.menubtn').removeClass('menu_on');
		}else{
		$('#gl_gm').slideToggle('fast');
			$('.menubtn').addClass('menu_on');
		}
	});
	
var w = jQuery(window).width();
var x = 567;
	if (w <= x) {	
	
	$('#gl_gm').hide();
	$('body#w_toppage #gl_gm').show();


}else{
}
});





/* -------------------------------------------------------------------

　画像のロールオーバー
------------------------------------------------------------------- */

// 画像のプリロード
$(document).ready(function() {
	$("a img").each(function(){
		if(String($(this).attr("src")).match(/_off\.(.*)$/)){
			var img = new Image();
			img.src = String($(this).attr("src")).replace(/_off\.(.*)$/,"_on.$1");
		}
	});
});

// 画像のロールオーバー
$(document).ready(function() {
	$('a img').hover(function(){
		$(this).attr('src',$(this).attr('src').replace('_off','_on'));
	},function(){
		$(this).attr('src',$(this).attr('src').replace('_on','_off'));
	});
});



/* -------------------------------------------------------------------

　スクロールで現れるpagetop
------------------------------------------------------------------- */

$(document).ready(function () {
	var pageTop = $('.w_page_top');
	pageTop.hide();
	$(window).scroll(function () {
		if ($(this).scrollTop() > 100) {
			pageTop.fadeIn();
		} else {
			pageTop.fadeOut();
		}
	});
    pageTop.click(function () {
		$('body, html').animate({scrollTop:0}, 500, 'swing');
		return false;
});
});




