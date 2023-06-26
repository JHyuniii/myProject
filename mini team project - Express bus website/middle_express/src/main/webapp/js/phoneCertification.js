/**
 * 
 */

//function checkAll(){
//	if(document.getElementById('agree3').checked = true){
//    	document.getElementById('agree1').checked = true;
//    	document.getElementById('agree2').checked = true;
//	}else if(document.getElementById('agree3').checked = false){
//		document.getElementById('agree1').checked = false;
//    	document.getElementById('agree2').checked = false;
//	}
//}

let chkList = $("input[type=checkbox]");

$("#agree3").on("click", function(){
  if($(this).is(":checked")){
    chkList.prop("checked", true);
  }else
    chkList.prop("checked", false);
});

/*
 window.onload=function(){
 window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
window.resizeTo(1920,1080); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
window.scrollTo(0,250); // 페이지 상단 광고를 바로 볼 수 있게 스크롤 위치를 조정
}
*/