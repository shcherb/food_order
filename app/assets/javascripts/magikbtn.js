var win1
function newWin() {
	win1 = window.open("", "myWindow", "toolbar=0,width=500,height=400");
        var iframe = win1.document.createElement('iframe');
            iframe.name = 'myFrame';
            iframe.frameBorder = "no";
            iframe.heght = "400";
            iframe.width = "500";
            iframe.src = 'http://localhost:3000/menus';
	    win1.document.body.appendChild(iframe);
	win1.focus();
} 

var mydiv = window.document.createElement('div');
mydiv.className = "fixRightBlock";
mydiv.innerHTML = '<form id="drop-block">\
    <span class="cart-submit">\
      <span class="btn-link-green btn-link">\
        <button class="btn-link-i" id="popup-checkout" onclick="newWin()" type="submit">Оформить заказ</button>\
      </span>\
    </span>\
  </form>';
window.document.body.appendChild(mydiv);
