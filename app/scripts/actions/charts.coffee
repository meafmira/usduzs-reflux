Api = require "../common/api"

ChartActions = Reflux.createActions [ 'load', 'loadComplete', 'loadError' ]

ChartActions.load.preEmit = ->
  weekData = $.get Api.path 'kurs/day-averages/6'
  monthData = $.get Api.path 'kurs/day-averages/29'
  $.when weekData, monthData
    .done (weekData, monthData) ->
      ChartActions.loadComplete week: weekData[0], month: monthData[0]

    .fail ChartActions.loadError

module.exports = ChartActions
