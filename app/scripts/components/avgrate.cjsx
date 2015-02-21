React = require "react"
RateStore = require "../stores/rate"
RateActions = require "../actions/rate"

AvgRate = React.createClass
  mixins: [Reflux.ListenerMixin]
  getInitialState: ->
    rate:
      buyAverage: null
      sellAverage: null

  componentWillMount: ->
    @listenTo RateStore, @onRateChange
    RateActions.load()

  onRateChange: (rate) ->
    @setState
      rate: rate

  render: ->
    <div className="text-center">
      <h1>Покупка: {@state.rate.buyAverage}</h1>
      <h1>Продажа: {@state.rate.sellAverage}</h1>
    </div>

module.exports = AvgRate
