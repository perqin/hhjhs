.pragma library

function sendHttpRequest(method, url, data, up, n, pw, onLoop) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        switch (xhr.readyState) {
        case xhr.OPENED: break;
        case xhr.HEADERS_RECEIVED:
            if (xhr.status != 200)
                //console.log(qsTr("Connection Error with code ") + xhr.status + " : " + xhr.statusText);
                onLoop(up, parseInt(n) + 1, pw);
            break;
        case xhr.DONE:
            if (xhr.status == 200) {
                try {
                    console.log(qsTr("Succeed!"));
                } catch (err) {
                    console.log(qsTr("Loading error."));
                }
            } else {
                //console.log(qsTr("Error."));
            }
            break;
        }

    }
    if (method === "GET") {
        xhr.open("GET", url);
        xhr.send();
    }
    if (method === "POST") {
        console.log(url + "?" + data);
        xhr.open("POST", url);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.setRequestHeader("Content-Length", data.length);
        xhr.send(data);
    }
}

function signUp(up, n, pw) {
    var user = up + "" + n;
    var pass = pw;
    var url = "http://webfinal.sinaapp.com/signup";
    var data = "name=" + user + "&password=" + pass;
    //console.log(url + "?" + data);
    sendHttpRequest("POST", url, data, up, n, pw, signUp);
}

