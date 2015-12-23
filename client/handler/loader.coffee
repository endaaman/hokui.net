module.exports = (Vue, router)->
    router.beforeEach (transition)->
        Vue.loader.hide()
        transition.next()
