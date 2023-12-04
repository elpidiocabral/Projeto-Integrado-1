if array_length(notLoadeds) {
	for (var i = 0; i < array_length(notLoadeds); i++){
		get = http_request(notLoadeds[i], "GET", 0, 0)
		array_delete(notLoadeds, i, 1)
	}
}