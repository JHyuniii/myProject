function loadInterestList(exerciseCode) {
	const settings = {
		async: true,
		crossDomain: true,
		url: `https://exercisedb.p.rapidapi.com/exercises/exercise/${exerciseCode}`,
		method: 'GET',
		headers: {
			'X-RapidAPI-Key': 'bcfdc4bf77mshb53d5d070911c0cp1c7b50jsn5fe0c386bc06',
			'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
		}
	};

	$.ajax(settings).done(function(response) {
		console.log(response);

		var col = document.createElement('div');
		col.className = 'col-2 d-flex justify-content-center';

		// 동적으로 추가할 HTML 코드 생성
		var cardHtml = `
        <div class="card" style="width: 18rem;">
        <img src="${response.gifUrl}" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">${response.name}</h5>
        </div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">준비물 : ${response.equipment}</li>
          <li class="list-group-item">자극 근육 : ${response.target}
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            ?
            </button>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">ℹ️ 상세 근육 정보</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            • abductors - 발외전근<br>
                            • abs - 복근<br>
                            • adductors - 발내전근<br>
                            • biceps - 이두근<br>
                            • calves - 종아리<br>
                            • cardiovascular system - 심혈관계<br>
                            • delts - 삼각근<br>
                            • forearms - 전완<br>
                            • glutes - 둔근<br>
                            • hamstrings - 햄스트링<br>
                            • lats - 광배근<br>
                            • levator scapulae - 견갑거근<br>
                            • pectorals - 대흉근<br>
                            • quads 사두<br>
                            • serratus anterior - 톱니근<br>
                            • spine - 척추<br>
                            • traps - 승모근<br>
                            • triceps - 삼두근<br>
                            • upper back - 상부 등<br>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        </ul>
        <div class="card-body">
        	<button type="button" class="btn btn-outline-dark interestDeleteBtn" data-id="${response.id}">삭제하기</button>
        </div>
      </div>
        `;

		var card = document.createElement('div');
		card.className = 'h-100';
		card.innerHTML = cardHtml;
		col.appendChild(card);

		// cardContainer 요소에 동적으로 HTML 코드 추가
		$("#cardContainer").append(col);


		$(".interestDeleteBtn").off('click').on('click', function() {
			let exerciseId = $(this).data('id');
			console.log("delete exerciseId : " + exerciseId);

			$.ajax({
				url: "interestDelete.do",
				type: "post",
				data: { "exerciseId": exerciseId },
				dataType: 'text',
				success: function(result) {
					if (result > 0) {
						location.reload();
					} else {
						alert("삭제가 완료되지 않았습니다. 다시 시도해주세요.");
					}
				},
                 error: function() {
                    alert("오류가 발생했습니다. 다시 시도해주세요 :)");
                }
            });
        });
    });
}