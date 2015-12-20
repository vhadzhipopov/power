'use strict';

angular.module('powerApp')
    .controller('MainController', function ($scope, Principal, PowerWS) {
        PowerWS.receive().then(null, null, function(value) {
            console.log(value);
        });

        $scope.foo = function() {
            return [new Date().getTime(), Math.random()*0.2];
        };

        Principal.identity().then(function(account) {
            $scope.account = account;
            $scope.isAuthenticated = Principal.isAuthenticated;
        });
    });
