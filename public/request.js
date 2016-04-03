var XHR = ("onload" in new XMLHttpRequest()) ? XMLHttpRequest : XDomainRequest;

var xhr = new XHR();
xhr.withCredentials = true;

xhr.open('GET', 'http://localhost:3000?user_email=user1@example.org&user_token=3UAFyzm-wF7gRvgvY3AX', true);

xhr.onload = function() {
    //alert( this.responseText );
    alert( this.status );
}

xhr.onerror = function() {
    alert( 'Service connection error' + this.status );
}

xhr.send();