
module.exports =
    template: do require './index.jade'
    # route:
    #     activate: (transition)->
    #         console.log('activate')
    #         transition.next()
    data: ->
        user: @$auth.user()

    methods:
        loader: ->
            if @$loader.visible()
                @$loader.hide()
            else
                @$loader.show()

        toast: ->
            @$toast 'はげ'
