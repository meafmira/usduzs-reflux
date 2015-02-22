ChartsStore = require "../../stores/charts"
ChartsActions = require "../../actions/charts"
LineChart = require '../line-chart'

Charts = React.createClass
  mixins: [Reflux.ListenerMixin]
  getInitialState: ->
    charts:
      weekLineData: {}
      monthLineData: {}

    width: 300

  componentWillMount: ->
    @listenTo ChartsStore, @onChartsChange
    ChartsActions.load()

  componentDidMount: ->
    @setState
      width: $(@getDOMNode).innerWidth() - 200

  onChartsChange: (charts) ->
    @setState
      charts: charts

  render: ->
    <div className="container">
      <div className="row">
        <div className="col-md-12">
          <div className="panel panel-default">
            <div className="panel-heading">
              За неделю
            </div>
            <div className="panel-body text-center">
              <div>
                <LineChart
                  className="line-chart"
                  data={@state.charts.weekLineData}
                />
              </div>
            </div>
          </div>
          <div className="panel panel-default">
            <div className="panel-heading">
              За месяц
            </div>
            <div className="panel-body text-center">
              <div>
                <LineChart
                  className="line-chart"
                  data={@state.charts.monthLineData}
                  height={300}
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

module.exports = Charts
