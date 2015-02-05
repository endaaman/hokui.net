'use strict'

angular.module modulePage
.config ($stateProvider) ->
    $stateProvider
    .state 'logout',
        url: '/logout'
        templateUrl: '/page/logout/logout.html'
        controller: 'LogoutCtrl'
        data:
            title: '北医ネット - ログアウト'

.controller 'LogoutCtrl',
    ($scope, $state, Auth, Notify) ->
        $scope.Auth = Auth

        $scope.performLogout = ()->
            Auth.logout()
            .then ->
                $state.go 'home'
                Notify 'ログアウトしました。', type: 'ok'

        if Auth.active()
            $scope.message = "you are active as #{Auth.user().handle_name}."
        else
            $scope.message = "you are inactive."
