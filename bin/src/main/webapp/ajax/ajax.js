/**
 * 
 */

var ajax = {};    //객체 생성
ajax.xhr = {};    //네임스페이스 즉 패키지를 만든다.

ajax.xhr.Request = function(url, params, callback, method) {
	this.url = url;
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.send();
}
ajax.xhr.Request.prototype = {    //json 형식은 문법으로도 사용할수 있고 데이터 형식으로도 사용할 수 있다. 이곳에서 사용한 방법은 문법으로서 사용되었다.
	getXMLHttpRequest: function() {
		if (window.ActiveXObject) {
			try {
				return new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e) {
				try {
					return new ActiveXObject("Microsoft.XMLHTTP");
				} catch(e1) { return null; }
			}
		} else if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		} else {
			return null;
		}
	},
	send: function() {
		this.req = this.getXMLHttpRequest();

		var httpMethod = this.method ? this.method : 'GET';
		if (httpMethod != 'GET' && httpMethod != 'POST') {
			httpMethod = 'GET';
		}
		var httpParams = (this.params == null || this.params == '') ?
		                 null : this.params;
		var httpUrl = this.url;
		if (httpMethod == 'GET' && httpParams != null) {
			httpUrl = httpUrl + "?" + httpParams;
		}
		this.req.open(httpMethod, httpUrl, true);
		this.req.setRequestHeader(
			'Content-Type', 'application/x-www-form-urlencoded');
		var request = this;
		this.req.onreadystatechange = function() {
			request.onStateChange.call(request);
		}
		this.req.send(httpMethod == 'POST' ? httpParams : null);
	},
	onStateChange: function() {
		this.callback(this.req);
	}
}