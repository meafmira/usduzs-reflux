React = require 'react'
AvgRate = require './avgrate'

Home = React.createClass

  render: ->
    return (
      <div className="jumbotron">
        <AvgRate />
      </div>
    )

module.exports = Home
