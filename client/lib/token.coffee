config = require '../config'
LS = window.localStorage
SS = window.sessionStorage

# kill old browsers
if not LS or not SS
    window.alert 'Your browser is too old.'
    throw new Error

module.exports = (Vue)->

    setHeader = (t)->
        console.log t
        Vue.http.headers.common[config.authHeaderName] = t


    token =
        set: (t, useLocalStorage = false)->
            @clear()
            S = if useLocalStorage then LS else SS
            S.setItem config.tokenStorageKey, t
            setHeader t
        get: ->
            if t = SS.getItem config.tokenStorageKey
                return t

            if t = LS.getItem config.tokenStorageKey
                return t
            ''
        exists: ->
            !!@get()
        clear: ->
            SS.removeItem config.tokenStorageKey
            LS.removeItem config.tokenStorageKey
            delete Vue.http.headers.common[config.authHeaderName]
        header: ->
            t = @get()
            if t
                "#{config.authHeaderName}": t
            else
                {}

    if t = token.get()
        setHeader t

    Vue.token = Vue.prototype.$token = token
