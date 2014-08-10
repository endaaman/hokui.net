angular.module('hokuiApp').controller 'AdminCtrl', [
    '$scope', '$rootScope', 'Auth',
    ($scope, $rootScope, Auth) ->
        if not Auth.current.active
            $rootScope.$broadcast 'unauthorize',
                message: 'You need to log in.'
        else
            if not Auth.current.user.admin
                $rootScope.$broadcast 'adminonly',
                    message: 'This page is admin-only.'
        $scope.message = 'This is Admin page.'

]

angular.module('hokuiApp').controller('AdminUserCtrl', [
    '$scope', 'User', 'Token',
    ($scope, User, Token) ->

        User.get {}, (data)->
            $scope.users = data.users


])
