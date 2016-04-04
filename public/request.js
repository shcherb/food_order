var XHR = ("onload" in new XMLHttpRequest()) ? XMLHttpRequest : XDomainRequest;

var xhr_options = new XHR();
xhr_options.open('OPTIONS', 'http://localhost:3000/', true);

xhr_options.onload = function() {
    //alert( this.responseText );
    alert( this.status );
}
xhr_options.onerror = function() {
    alert( 'Service connection error' + this.status );
}
xhr_options.send();

var xhr_get = new XHR();
xhr_get.withCredentials = true;
xhr_get.open('GET', 'http://localhost:3000?user_email=user1@example.org&user_token=3UAFyzm-wF7gRvgvY3AX', true);

xhr_get.onload = function() {
    //alert( this.responseText );
    alert( this.status );
}
xhr_get.onerror = function() {
    alert( 'Service connection error' + this.status );
}
xhr_get.send();