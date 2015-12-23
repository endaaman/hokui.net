
module.exports = (Vue)->

    vm = new Vue
        template: do require './index.jade'
        data:
            visible: false

    vm.$mount().$appendTo document.body

    Vue.loader = Vue.prototype.$loader =
        hide: ->
            vm.visible = false
        show: ->
            vm.visible = true
        visible: ->
            vm.visible
