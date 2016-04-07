function newWin3() {
  if (win1 == undefined || win1.closed) {
    win1 = window.open("", "myWindow", "toolbar=1,width=500,height=400");
    $.ajax({
      url: "http://localhost:3000/order",
      crossDomain: true,
      context: win1.document.body,
      cache: false,
      success: function (html) {
        $(this).append(html);
      }
    });
  }
  win1.focus();
}


function newWin() {
  if (win1 == undefined || win1.closed) {
    win1 = window.open("", "myWindow", "toolbar=1,width=800,height=600");
    var iframe = win1.document.createElement('iframe');
    iframe.name = 'myFrame';
    iframe.frameBorder = "no";
    iframe.height = "590";
    iframe.width = "790";
    iframe.src = 'http://localhost:3000/order';
    win1.document.body.appendChild(iframe);
  }
  win1.focus();
}

function newWin1() {
  var XHR = ("onload" in new XMLHttpRequest()) ? XMLHttpRequest : XDomainRequest;

var xhr_get = new XHR();
xhr_get.open('GET', 'http://localhost:3000/order', true);

xhr_get.onload = function() {
  //alert( this.responseText );
  alert( this.status );
}
xhr_get.onerror = function() {
  alert( 'Service connection error' + this.status );
}
xhr_get.send();
}



var win1
var mydiv = window.document.createElement('div');
mydiv.className = "fixRightBlock";
mydiv.innerHTML = '\
    <span class="cart-submit">\
      <span class="btn-link-green btn-link">\
        <button class="btn-link-i" id="popup-checkout" onclick="newWin()" type="submit">Оформить заказ</button>\
      </span>\
    </span>\
  ';
window.document.body.appendChild(mydiv);
