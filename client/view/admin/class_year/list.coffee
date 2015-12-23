Vue = require 'vue'

ClassYear = require '../../../resource/class_year'

module.exports =
    template: do require './list.jade'
    data: ->
        classYears: []
    route:
        activate: (transition)->
            pendings.push ClassYear.get().success (res)=>
                @classYears = res
