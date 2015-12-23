Vue = require 'vue'
config = require '../config'

# module.exports = (Vue)->
#     User = Vue.resource "#{config.api}/users/:id"
#
#     Vue.resources.User = Vue.prototype.$resouces = User

module.exports = Vue.resource "#{config.api}/users/:id"
