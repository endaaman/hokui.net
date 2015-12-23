
t =  template: '<router-view></router-view>'


admin =
    '/':
        name: 'admin'
        component: require './view/admin/top'
    '/user':
        component: t
        subRoutes:
            '/':
                name: 'admin.user'
                component: require './view/admin/user/list'

    '/class_year':
        component: t
        subRoutes:
            '/':
                name: 'admin.class_year'
                component: require './view/admin/class_year/list'

base =
    '/':
        name: 'home'
        component: require './view/home'

    '/login':
        name: 'login'
        component: require './view/login'

    '/logout':
        name: 'logout'
        component: require './view/logout'

    '/signup':
        name: 'signup'
        component: require './view/signup'

    '/help':
        name: 'help'
        component: require './view/help'

    '/admin':
        component: require './view/admin'
        subRoutes: admin

    '*':
        name: '404'
        component: require './view/404'

module.exports = base
