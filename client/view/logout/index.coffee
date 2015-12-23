module.exports =
    template: do require './index.jade'
    methods:
        performLogout: ->
            @$auth.logout()
            # Vue.nextTick =>
            @$route.router.go '/', true
            @$toast 'ログアウトしました。'
