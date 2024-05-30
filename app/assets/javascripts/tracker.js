document.addEventListener("DOMContentLoaded", function() {
    var visitDuration = 0;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/track", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  
    var params = "page_url=" + encodeURIComponent(window.location.href) + "&duration=" + visitDuration;
    xhr.send(params);
  });