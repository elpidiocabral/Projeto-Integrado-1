r_str = async_load[? "result"]

if (r_str == "ok" || r_str == "Ok" || r_str == "OK") {}
else
	if (toDeletePath != "")
		http_request(toDeletePath, "DELETE", 0 ,0)