function loadExercise(exerciseName) {
	const settings = {
		async: true,
		crossDomain: true,
		url: `https://exercisedb.p.rapidapi.com/exercises/bodyPart/${exerciseName}`,
		method: 'GET',
		headers: {
			'X-RapidAPI-Key': 'bcfdc4bf77mshb53d5d070911c0cp1c7b50jsn5fe0c386bc06',
			'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
		}
	};

	$.ajax(settings).done(function(response) {
		console.log(response);

		var container = document.getElementById('cardContainer');
		container.innerHTML = '';

		var row;
		// 응답의 길이와 15 중 작은 값을 사용하여 최대 15개의 항목만 보이도록 반복
		var itemCount = Math.min(response.length, 15);

		for (var index = 0; index < itemCount; index++) {
			var item = response[index];

			if (index % 3 === 0) {
				row = document.createElement('div');
				row.className = 'row';
				container.appendChild(row);
			}

			var col = document.createElement('div');
			col.className = 'col-md-4 d-flex justify-content-center';
			row.appendChild(col);

			var cardContent = `
        <div class="card" style="width: 23rem;">
        <img src="${item.gifUrl}" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">${item.name}</h5>
        </div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">준비물 : ${item.equipment}</li>
          <li class="list-group-item">자극 근육 : ${item.target}
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
        	<button type="button" class="btn btn-outline-info saveExercise">저장하기</button>
        </div>
      </div>
        `;

			var card = document.createElement('div');
			card.className = 'h-100 mt-2';
			card.innerHTML = cardContent;
			col.appendChild(card);

			// 저장하기 버튼의 참조를 찾고 item.id 값을 data 속성에 저장합니다.
			var saveExerciseButton = card.querySelector('.saveExercise');
			saveExerciseButton.dataset.id = item.id;
			console.log("saveExerciseButton.dataset.id : " + saveExerciseButton.dataset.id);

			$(saveExerciseButton).on('click', function() {
				let exerciseCode = this.dataset.id;
				console.log("exerciseCode : " + exerciseCode);

				var currentSaveExerciseButton = $(this);
				$.ajax({
					url: "saveExercise.do",
					type: "post",
					data: { "exerciseCode": exerciseCode },
					dataType: 'text',
					success: function(result) {
						console.log("save Exercise result : " + result);
						if (result == 1) {
							currentSaveExerciseButton.attr("disabled", true);
						} else if (result == -1) {
							alert("이미 관심 목록에 있는 운동입니다.");
							currentSaveExerciseButton.attr("disabled", false);
						} else if (result == 3) {
							alert("로그인 후 이용해주세요.");
							currentSaveExerciseButton.attr("disabled", false);
						} else {
							currentSaveExerciseButton.attr("disabled", false);
						}
					},
					error: function() {
						alert("오류가 발생했습니다. 다시 시도해주세요 :)");
					}
				})
			})
		}
	});
}


