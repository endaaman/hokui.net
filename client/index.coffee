require './style/index.sass'

window._Promise = window.Promise
window.Promise = require 'bluebird'

require './ga'
(require './lib/font')
    'Source Sans Pro': true
    'Lato': true

Vue = require 'vue'
Vue.config.debug = true
Router = require 'vue-router'

Vue.use Router
Vue.use require 'vue-resource'
Vue.use require 'vue-validator'
# for IE's force-cached ajax
Vue.http.headers.common['If-Modified-Since'] = 0


Vue.use require './lib/token'
Vue.use require './lib/auth'

Vue.use require './lib/loader'
Vue.use require './lib/toast'

Vue.use require './component/date-bind'


router = new Router
    history: true
    saveScrollPosition: true

router.map require './routes'

root = Vue.extend (require './view/root')

(require './handler') Vue, router

start = ->
    router.start root, '#app'

if Vue.token.exists()
    Vue.auth.check().done start
else
    start()

if process.env.NODE_ENV is 'development'
    window.Vue = Vue
