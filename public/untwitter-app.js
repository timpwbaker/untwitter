var untwitterApp = angular.module('untwitterApp', []);

untwitterApp.controller('MessagesController', function($scope, $http) {

    var mc = this;

    var getMessages = function() {

        $http.get("/messages.json").then(
        	function success(response) {
            	mc.messages = response.data;
        	}, 
        	function failure(response) {
            	alert(JSON.stringify(response));
        	}
        );

    };

    getMessages();

    mc.postMessage = function() {

        var postBody = { "utf8": true, "message": { "message_body": mc.new_message }, "commit": "Send message" };

        $http.post("/messages.json", postBody).then(
        	function success(response) {
            	getMessages();
        	}, 
        	function failure(response) {
            	getMessages();
        	}
        );

    };


});