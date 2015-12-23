module.exports = (Vue, router)->
    router.beforeEach (transition)->
        Vue.toast.hide()
        transition.next()
