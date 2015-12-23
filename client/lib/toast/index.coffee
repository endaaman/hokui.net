module.exports = (Vue)->
    vm = new Vue
        template: do require './index.jade'
        data: ->
            message: ''
            period: -1
            timeoutId: null
        methods:
            cancelClosing: ->
                if @timeoutId
                    clearTimeout @timeoutId
                    @timeoutId = null

            show: (message, period)->
                @$el.classList.add 'toast-active'
                @message = message

                # auto close: not provided or set positive
                @period = Math.abs((parseInt period) or 4000)
                @cancelClosing()
                if @period > 0
                    @timeoutId = setTimeout =>
                        @hide()
                    , @period

            hide: ->
                @cancelClosing()
                @$el.classList.remove 'toast-active'

    vm.$mount().$appendTo document.body

    toast = (message, period)->
        vm.show message, period

    toast.hide = ->
        vm.hide()

    Vue.toast = Vue.prototype.$toast = toast
