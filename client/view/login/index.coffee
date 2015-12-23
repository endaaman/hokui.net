config = require '../../config'

module.exports =
    template: do require './index.jade'
    data: ->
        fakeValue: false
        active: @$auth.active()
        credentials:
            email: ''
            password: ''
        keepLogin: false
    methods:
        performLogin: (e)->
            e.preventDefault()
            if @invalid
                @$toast '入力に不備があります'
                return

            @$loader.show()
            @$auth.login @credentials, @keepLogin
            .then =>
                @$route.router.go name: 'home'
                @$toast 'ようこそ、北医ネットへ！'
            , =>
                @$toast 'メールアドレスもしくはパスワードが間違っています'
                @$loader.hide()
