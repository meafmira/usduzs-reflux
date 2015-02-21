React = require 'react'
Router = require 'react-router'
Navbar = require './navbar'
RouteHandler = Router.RouteHandler

Layout = React.createClass

  render: ->

    return (
      <div className="App">
        <Navbar/>
        <RouteHandler />
      </div>
    )

module.exports = Layout
