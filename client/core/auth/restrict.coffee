'use strict'

angular.module moduleCore

.provider 'Restrict', ->
    _default =
        error: 'You have no permission to access the page you try to view.'

    setError: (error)->
        _default.error = error

    setNext: (next)->
        _default.next = next

    $get: (Auth)->
        if not _default.next?
            throw new Error 'Need to set default state to be redirect to'

        (state)->
            _result =
                can: true

            if state.data?.restrict?
                restrict = state.data.restrict
                _result.can = Auth.can restrict.role

                if not _result.can
                    _result.error = restrict.error or _default.error
                    _result.next = restrict.next or _default.next

            _result
