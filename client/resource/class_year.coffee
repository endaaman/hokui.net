Vue = require 'vue'
config = require '../config'

module.exports = Vue.resource "#{config.api}/class_years/:id"
