/*
let today = new java.util.Date();
let tomorrow = new Date(new Date().getTime() + 60*60*24*1000);
 function changeToday() {
        document.getElementById("dateC").innerText = today;
    }
 function changeTomorrow() {
        document.getElementById("dateC").innerText = tomorrow;
    }
$("#todaybtn").click(function(){
   $("#dateC").text("today");
});
$("#tomorrowbtn").click(function(){
   $("#dateC").text("tomorrow");
});
 */
$("#reservation").on("click", function(){
	if($(this).is(":checked")){
		$("#main_Tab").show();
		$("#main2_Tab").hide();
		$("#main3_Tab").hide();
	}
});
$("#confirm").on("click", function(){
	if($(this).is(":checked")){
		$("#main2_Tab").show();
		$("#main_Tab").hide();
		$("#main3_Tab").hide();
	}
});
$("#TOA").on("click", function(){
	if($(this).is(":checked")){
		$("#main3_Tab").show();
		$("#main_Tab").hide();
		$("#main2_Tab").hide();
	}
});


$("#today").on("click", function(){
	if($(this).is(":checked")){
		$("#today_1").show();
		$("#tomorrow_1").hide();
	}
});
$("#tomorrow").on("click", function(){
	if($(this).is(":checked")){
		$("#tomorrow_1").show();
		$("#today_1").hide();
	}
});

$("#transfer").on("click", function(){
	document.getElementById("directIcon").style.opacity = 0; 	
});
$("#direct").on("click", function(){
	document.getElementById("directIcon").style.opacity = 1; 	
});
/*
let a = document.getElementById("a");
let mainTab = document.getElementById("main_Tab");

a.addEventListener('click', show());
function show() {
	document.getElementById("main_Tab").style.display="block"
};

$("#main_Tab").show() //보이기
$("#main_Tab").hide() //감추기
*/

const modal = document.getElementById("modal")
	
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
})

var btnModal = document.getElementById( 'departure' );
btnModal.addEventListener("click", e => {
    modal.style.display = "flex"
});

$(function() {
            //input을 datepicker로 선언
            $("#datepicker").datepicker({
                dateFormat: 'yy.mm.dd'
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
				,buttonImage: "images/calender.png" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                //,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            });                    
            $("#datepickerGo").datepicker({
                dateFormat: 'yy.mm.dd'
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
				,buttonImage: "images/calender.png" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                //,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            });                    
            $("#datepickerCome").datepicker({
                dateFormat: 'yy.mm.dd'
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "images/calender.png" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                //,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            });                    
            
            //초기값을 오늘 날짜로 설정
            $("#datepicker").datepicker();                    
            $("#datepickerGo").datepicker();
            $("#datepickerCome").datepicker();
            
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            $('#datepickerGo').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            $('#datepickerCome').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        });
        
function tomorrow(){
	$('#datepicker').datepicker('setDate', '+1D');
}        
function today(){
	$('#datepicker').datepicker('setDate', 'today');
}
$("#oneway").on("click", function(){
	if($(this).is(":checked")){
		$("#date").show();
		$("#date2").hide();
	}
});
$("#roundtrip").on("click", function(){
	if($(this).is(":checked")){
		$("#date2").show();
		$("#date").hide();
	}
});