$(document).ready(function() {
	selectPlayer();
	login();
	register();
});

function ajaxCall(method, url, data, dataType, callback) {
	console.log(data)
	$.ajax({
		method: method,
		url: url,
		data: data,
		dataType: dataType
	})
	.done(function(response){
		console.log("it worked");
		console.log(response);
		callback(response);
	})
	.fail(function(response){
		console.log("it didn't worked");
		console.log(response);
	})
}

	function set(button) {
		var index = $(button).parent().parent().index();
		return index + 1;
	}
	var counter = 0

function selectPlayer() {
	$('.select-player').on('click', function(e){
		var button = this;
		e.preventDefault();
		function callback(response) {
			counter += 1;
			$(button).parent().parent().hide();
			if(response.full_teams){
				$('.finish-draft').removeClass('hidden');
				$('.float-right').html('The draft is complete')
			}
			else {
				$('.float-right').html(response.team_name + " is picking");
			}
		}
		var data = set(button)
		ajaxCall('post', $(button).attr("href"), {player_id: data}, 'json', callback);
	});
}

function login() {
	$('#login').on('click', function(e){
		e.preventDefault();
		function callback(response) {
			$('#yield').replaceWith(response);
		}
		ajaxCall('get', '/login', null, 'html', callback);
	});
}

function register() {
	$('#register').on('click', function(e){
		e.preventDefault();
		function callback(response) {
			$('#yield').replaceWith(response);
		}
		ajaxCall('get', '/register', null, 'html', callback);
	});
}




	// $('.select-player').on('click', function(e){
	// 	e.preventDefault();
	// 	console.log("button clicked");
	// 	console.log(this);
	// 	var button = this;
	// 	playerIndex = set(this);
	// 	console.log(playerIndex);
	// 	var url = $(this).attr("href")
	// 	var addPlayerToTeam = $.ajax({
	// 		method: 'post',
	// 		url: url,
	// 		dataType: 'json',
	// 		data: {player_id: playerIndex}
	// 	});
	// 	addPlayerToTeam.done(function(response){
	// 		console.log("it worked");
	// 		console.log(response);
	// 		counter += 1;
	// 		$(button).parent().parent().hide();
	// 		console.log(counter)
	// 		if(response.full_teams){
	// 			$('.finish-draft').removeClass('hidden');
	// 			$('.float-right').html('The draft is complete')
	// 		}
	// 		else {
	// 			$('.float-right').html(response.team_name + " is picking");
	// 		}
	// 	});
	// 	addPlayerToTeam.fail(function(response){
	// 		console.log("this didn't work");
	// 		console.log(response);
	// 	});
	// })

// 	$.post('/buyitem', { key1: 'value1', key2: 'value2' }, function(result) {
//     alert('successfully posted key1=value1&key2=value2');
// });

// $( "#autocomplete" ).autocomplete({
//   source: [ "Steph Curry", "Klay Thompson", "TEST" ]
// });

// 	$('#autocomplete').autocomplete({
//     serviceUrl: '/drafts/:id', //how is it gonna get :id?
//     onSelect: function (suggestion) {
//         alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
//     }
// });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
