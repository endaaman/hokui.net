config = require '../config'

module.exports = (Vue)->
    user = null
    setUser = (u)->
        user = Vue.util.extend {}, u

    Vue.auth = Vue.prototype.$auth =
        active: -> user?
        user: -> user
        check: ->
            Vue.http
            .get "#{config.api}/profile", (data)->
                setUser data
            .error (err)=>
                console.log err
                # @silentLogout()

        login: (credentials, saveToken)->
            Vue.http
            .post "#{config.api}/session", credentials, (data)->
                Vue.token.set data.token, saveToken
                setUser data.user
            .error (err)=>
                @silentLogout()

        silentLogout: ->
            user = null
            Vue.token.clear()

        logout: ->
            Vue.http.delete "#{config.api}/session"
            @silentLogout()
