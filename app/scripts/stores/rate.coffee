Reflux = require "reflux"
RateActions = require "../actions/rate"

RateStore = Reflux.createStore
  init: ->
    @_rate = {}
    @listenTo RateActions.loadComplete, @onLoad

  onLoad: (rate) ->
    @_rate = rate
    @trigger(rate)

module.exports = RateStore
