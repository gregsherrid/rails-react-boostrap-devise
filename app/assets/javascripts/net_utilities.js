function getJSON(url, success) {
	requestJSON(url, null, 'GET', success);
}

function postJSON(url, data, success) {
	requestJSON(url, data, 'POST', success);
}

function patchJSON(url, data, success) {
	requestJSON(url, data, 'PATCH', success);
}

function deleteJSON(url, success) {
	requestJSON(url, null, 'DELETE', success);
}

function requestJSON(url, data, type, success) {
	remoteRequest(url, data, type, "json", success)
}

function remoteRequest(url, data, type, dataType, success) {
	$.ajax({
		url: url, dataType: dataType, type: type, data: data, success: success,
		error: function(xhr, status, err) {
			console.error(url, status, err.toString());
		}
	});
}
