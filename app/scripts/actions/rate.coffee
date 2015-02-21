Reflux = require "reflux"
Api = require "../common/api"

RateActions = Reflux.createActions [ 'load', 'loadComplete', 'loadError' ]

RateActions.load.preEmit = ->
  $.get Api.path('kurs')
    .done RateActions.loadComplete
    .fail RateActions.loadError

module.exports = RateActions
