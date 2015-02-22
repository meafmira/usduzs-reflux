Chart = require "chart.js"
cancelAnimFrame = do ->
  window.cancelAnimationFrame ||
  window.webkitCancelAnimationFrame ||
  window.mozCancelAnimationFrame ||
  window.oCancelAnimationFrame ||
  window.msCancelAnimationFrame ||
  (callback)->
    return window.clearTimeout callback, 1000 / 60

Chart.defaults.global.responsive = true
Chart.defaults.global.maintainAspectRatio = false

for name, Type of Chart.types
  Type::stop = -> cancelAnimFrame this.animationFrame

LineChart = React.createClass
  getInitialState: ->
    {}

  init: (props) ->
    if props.data.datasets?
      el = @getDOMNode();
      ctx = el.getContext("2d");
      options = props.options || {}
      if @state.chart?
        @state.chart.initialize props.data
      else
        @state.chart = new Chart(ctx).Line(props.data, options)

  componentDidMount: ->
    @init(@props)

  componentWillReceiveProps: (props) ->
    #@state.chart.destroy() if @state.chart
    @init(props)

  render: ->
    <canvas height={ @props.height || 300 }></canvas>


module.exports = LineChart
