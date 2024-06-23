
$(document).ajaxSend(function (event, jqxhr, settings) {
    jqxhr.setRequestHeader('X-Authrization', 'new-value')
});


//function ajaxRequest(httpMetodo, url, onSucesso, onErro) {
// 	$.ajax({
//        type: httpMetodo,
//        url: url,
//        success: onSucesso
//        error: onErro
//	});
//
//}