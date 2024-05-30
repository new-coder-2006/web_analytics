document.addEventListener("DOMContentLoaded", function() {
    var startTime = new Date().getTime();
    window.onbeforeunload = sendRequest;
    function sendRequest() {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/track", true);
        var visitDuration = new Date().getTime() - startTime;
        var params = "page_url=" + encodeURIComponent(window.location.href) + "&duration=" + visitDuration;
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(params);
    }
  });