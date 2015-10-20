$(document).ready(function() {
	selectPlayer();
	login();
	register();
	viewStats();
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
		console.log("it didn't work");
		console.log(response);
	})
}

function viewStats() {
	$('#view-stats').on('click', function(e){
		var button = this;
		e.preventDefault();
		function callback(response) {
		}
	ajaxCall('post', $(button).attr("href"), {player_id: data}, 'json', callback);
	});
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
				$('.current-team').html('The draft is complete');
				$('.select-player').addClass('hidden');
			}
			else {
				$('.current-team').html(response.team_name + " is picking");
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