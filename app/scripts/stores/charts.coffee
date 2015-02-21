ChartsActions = require "../actions/charts"

ChartsStore = Reflux.createStore
  init: ->
    @charts = {}
    @listenTo ChartsActions.loadComplete, @onLoad

  onLoad: (charts) ->
    @charts = charts
    averages = charts.week
    labels = charts.week.filter((avg) -> avg.type == 'sell').map (avg) -> avg.day
    datasets = [
      label: "Покупка"
      fillColor: "rgba(220,220,220,0.2)",
      strokeColor: "rgba(220,220,220,1)",
      pointColor: "rgba(220,220,220,1)",
      pointStrokeColor: "#fff",
      pointHighlightFill: "#fff",
      pointHighlightStroke: "rgba(220,220,220,1)",
      data: averages.filter((avg) -> avg.type == 'buy').map (avg) -> avg.avgKurs
    ,
      label: "Продажа"
      fillColor: "rgba(151,187,205,0.2)",
      strokeColor: "rgba(151,187,205,1)",
      pointColor: "rgba(151,187,205,1)",
      pointStrokeColor: "#fff",
      pointHighlightFill: "#fff",
      pointHighlightStroke: "rgba(151,187,205,1)",
      data: averages.filter((avg) -> avg.type == 'sell').map (avg) -> avg.avgKurs
    ]
    charts.weekLineData = { labels: labels, datasets: datasets }

    averages = charts.month
    labels = averages.filter((avg) -> avg.type == 'sell').map (avg) -> avg.day
    datasets = [
      label: "Покупка"
      fillColor: "rgba(220,220,220,0.2)",
      strokeColor: "rgba(220,220,220,1)",
      pointColor: "rgba(220,220,220,1)",
      pointStrokeColor: "#fff",
      pointHighlightFill: "#fff",
      pointHighlightStroke: "rgba(220,220,220,1)",
      data: averages.filter((avg) -> avg.type == 'buy').map (avg) -> avg.avgKurs
    ,
      label: "Продажа"
      fillColor: "rgba(151,187,205,0.2)",
      strokeColor: "rgba(151,187,205,1)",
      pointColor: "rgba(151,187,205,1)",
      pointStrokeColor: "#fff",
      pointHighlightFill: "#fff",
      pointHighlightStroke: "rgba(151,187,205,1)",
      data: averages.filter((avg) -> avg.type == 'sell').map (avg) -> avg.avgKurs
    ]
    charts.monthLineData = { labels: labels, datasets: datasets }

    @trigger(charts)

module.exports = ChartsStore
